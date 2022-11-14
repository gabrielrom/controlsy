//
//  MainCoordinator.swift
//  controlsy
//
//  Created by Gabriel Matheus on 04/11/22.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var childCoordinators: [ChildCoordinatorProtocol] { get }
    var navigation: UINavigationController { get }
    
    func start() -> UINavigationController
    func addChildCoordinator(with coordinator: ChildCoordinatorProtocol)
    func handleNavigation(to screen: NavigationType, navigation: UINavigationController)
}

enum NavigationType {
    case onboarding
    case session
    case home
}

class MainCoordinator: CoordinatorProtocol {
    var childCoordinators: [ChildCoordinatorProtocol] = [ChildCoordinatorProtocol]()
    var navigation: UINavigationController = UINavigationController()
    
    func start() -> UINavigationController {
        let navigationType = getNavigationType()
        navigation.isNavigationBarHidden = true
        handleNavigation(to: navigationType, navigation: navigation)
        return navigation
    }
}

// MARK: Utils
extension MainCoordinator {
    func getNavigationType() -> NavigationType {
        let type = UserDefaults.standard.string(forKey: "access_type")
        
        switch type {
        case "onboarding": return .onboarding
        case "session": return .session
        case "home": return .home
        default: return .onboarding
        }
    }
    
    func addChildCoordinator(with coordinator: ChildCoordinatorProtocol) {
        childCoordinators.append(coordinator)
    }
    
    func handleNavigation(to screen: NavigationType, navigation: UINavigationController) {
        switch screen {
        case .onboarding:
            let onboardingCoordinator = OnBoardingCoordinator(navigation: navigation,
                                                              mainCoordinator: self)
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
