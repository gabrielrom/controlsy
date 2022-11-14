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
    
    var navigation: UINavigationController
    var disposeBag: DisposeBag = DisposeBag()
    
    init(navigation: UINavigationController, mainCoordinator: MainCoordinator) {
        self.navigation = navigation
        self.mainCoordinator = mainCoordinator
    }
    
    func start() {
        let viewModel = OnBoardingViewModel()
        let viewController = OnBoardingViewController(viewModel: viewModel)
        
        viewModel.selectedSteps
                 .asDriver()
                 .drive(onNext: { [weak self] step in
            guard let self = self else { return }
            
            switch step {
            case .didSignIn, .didSignUp:
                self.mainCoordinator?.handleNavigation(to: .session,
                                                       navigation: self.navigation)
            default: return
            }
        }).disposed(by: disposeBag)
        
        self.navigation.pushViewController(viewController, animated: false)
    }
}
