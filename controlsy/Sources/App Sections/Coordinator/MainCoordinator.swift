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
        
        switch navigationType {
        case .onboarding:
            let onboardingCoordinator = OnBoardingCoordinator(navigation: self.navigation)
            addChildCoordinator(with: onboardingCoordinator)
            onboardingCoordinator.start()
        
        case .session:
            let sessionCoordinator = SessionsCoordinator(navigation: self.navigation)
            addChildCoordinator(with: sessionCoordinator)
            sessionCoordinator.start()
            
        case .home:
            print("Home")
        }
        
        return navigation
    }
}

// MARK: Utils
extension MainCoordinator {
    func getNavigationType() -> NavigationType {
        let type = UserDefaults.standard.string(forKey: "access_type")
        
        switch type {
        case "onboarding":
            return .onboarding
        case "session":
            return .session
        case "home":
            return .home
        default:
            return .onboarding
        }
    }
    
    func addChildCoordinator(with coordinator: ChildCoordinatorProtocol) {
        childCoordinators.append(coordinator)
    }
}
