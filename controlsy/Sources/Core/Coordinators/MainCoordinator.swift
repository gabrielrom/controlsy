//
//  MainCoordinator.swift
//  controlsy
//
//  Created by Gabriel Matheus on 04/11/22.
//

import Foundation
import UIKit
import RxSwift

protocol CoordinatorProtocol {
    var childCoordinators: [ChildCoordinatorProtocol] { get }
    var navigation: UINavigationController { get }
    
    func start() -> UINavigationController
    func getNavigationType() -> NavigationType
    func addChildCoordinator(with coordinator: ChildCoordinatorProtocol)
    func removeChildCoordinator(id: UUID)
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
        navigation.isNavigationBarHidden = true
        handleNavigation(to: getNavigationType(), navigation: navigation)
        return navigation
    }
    
    func handleNavigation(to screen: NavigationType, navigation: UINavigationController) {
        switch screen {
        case .onboarding:
            let onboardingDisposeBag = DisposeBag()
            var onboardingCoordinator = OnBoardingCoordinator(navigation: navigation,
                                                              mainCoordinator: self,
                                                              disposeBag: onboardingDisposeBag)
            
            onboardingCoordinator.selectedStep
                                 .subscribe(onNext: { [weak self] step in
                guard let self = self else { return }
                switch step {
                    case .stop:
                    onboardingCoordinator.clean()
                    self.removeChildCoordinator(id: onboardingCoordinator.uniqueIdentifier)
                    default: return
                }
            }).disposed(by: onboardingDisposeBag)
            
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
    
    func removeChildCoordinator(id: UUID) {
        childCoordinators.removeAll(where: { $0.uniqueIdentifier.uuidString == id.uuidString })
    }
}
