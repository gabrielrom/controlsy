//
//  OnBoardingCoordinator.swift
//  controlsy
//
//  Created by Gabriel Matheus on 04/11/22.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class OnBoardingCoordinator: ChildCoordinatorProtocol {
    weak var mainCoordinator: MainCoordinator?
    
    var uniqueIdentifier: UUID = UUID()
    var navigation: UINavigationController?
    var disposeBag: DisposeBag?
    var selectedStep: BehaviorRelay<Step> = BehaviorRelay<Step>(value: .none)
    var rootViewController: UIViewController?
    
    init(navigation: UINavigationController,
         mainCoordinator: MainCoordinator,
         disposeBag: DisposeBag) {
        self.navigation = navigation
        self.mainCoordinator = mainCoordinator
        self.disposeBag = disposeBag
    }
    
    func start() {
        guard let disposeBag = disposeBag,
              let navigation = navigation else { return }

        let viewModel = OnBoardingViewModel()
        let viewController = OnBoardingViewController(viewModel: viewModel)
        
        viewModel.selectedSteps
                 .asDriver()
                 .drive(onNext: { [weak self] step in
            guard let self = self else { return }
            
            switch step {
            case .didSignIn, .didSignUp:
                self.mainCoordinator?.handleNavigation(to: .session,
                                                       navigation: navigation)
                self.selectedStep.accept(.stop)
            default: return
            }
        }).disposed(by: disposeBag)
        
        rootViewController = viewController
        navigation.pushViewController(viewController, animated: false)
    }
    
    func cleanCoordinator() {
        guard let rootViewController = rootViewController else { return }

        rootViewController.removeFromParent()

        self.disposeBag = nil
        self.navigation = nil
        self.rootViewController = nil
        self.mainCoordinator = nil
    }
}
