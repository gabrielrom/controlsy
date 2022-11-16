//
//  MainCoordinator+Utils.swift
//  controlsy
//
//  Created by Gabriel Matheus on 16/11/22.
//

import Foundation
import RxSwift

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
    
    func observeSelectedStep(of childCoordinator: ChildCoordinatorProtocol, with disposeBag: DisposeBag) {
        childCoordinator.selectedStep
                        .subscribe(onNext: { [weak self] step in
            guard let self = self else { return }
            switch step {
                case .stop:
                childCoordinator.cleanCoordinator()
                self.removeChildCoordinator(id: childCoordinator.uniqueIdentifier)
                default: return
            }
        }).disposed(by: disposeBag)
    }
}
