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
    func addChildCoordinator(with coordinator: ChildCoordinatorProtocol)
    func removeChildCoordinator(id: UUID)
    func handleNavigation(to screen: NavigationType, navigation: UINavigationController)
}
