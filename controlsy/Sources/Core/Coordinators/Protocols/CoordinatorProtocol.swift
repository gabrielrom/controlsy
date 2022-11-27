//
//  CoordinatorProtocol.swift
//  controlsy
//
//  Created by Gabriel Matheus on 16/11/22.
//

import Foundation
import UIKit
import RxSwift

protocol CoordinatorProtocol {
    var childCoordinators: [ChildCoordinatorProtocol] { get }
    var navigation: UINavigationController { get }
    
    func start() -> UINavigationController
    func getNavigationType() -> NavigationType
    func handleNavigation(to screen: NavigationType, navigation: UINavigationController)

    func addChildCoordinator(with coordinator: ChildCoordinatorProtocol)
    func removeChildCoordinator(id: UUID)
    func observeSelectedStep(of childCoordinator: ChildCoordinatorProtocol, with disposeBag: DisposeBag)
}
