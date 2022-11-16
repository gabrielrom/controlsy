//
//  MainCoordinator.swift
//  controlsy
//
//  Created by Gabriel Matheus on 04/11/22.
//

import Foundation
import UIKit
import RxSwift

final class MainCoordinator: CoordinatorProtocol {
    var childCoordinators: [ChildCoordinatorProtocol] = [ChildCoordinatorProtocol]()
    var navigation: UINavigationController = UINavigationController()
    
    func start() -> UINavigationController {
        navigation.isNavigationBarHidden = true
        handleNavigation(to: getNavigationType(), navigation: navigation)
        return navigation
    }
    
    func handleNavigation(to screen: NavigationType, navigation: UINavigationController) {
        switch screen {
        case .onboarding:
            let onboardingDisposeBag = DisposeBag()
            let onboardingCoordinator = OnBoardingCoordinator(navigation: navigation,
                                                              mainCoordinator: self,
                                                              disposeBag: onboardingDisposeBag)
            
            observeSelectedStep(of: onboardingCoordinator, with: onboardingDisposeBag)
            addChildCoordinator(with: onboardingCoordinator)
            
            onboardingCoordinator.start()
        case .session:
            let sessionCoordinator = SessionsCoordinator(navigation: navigation,
                                                         mainCoordinator: self)
            addChildCoordinator(with: sessionCoordinator)
            sessionCoordinator.start()
        default: return
        }
    }
}
