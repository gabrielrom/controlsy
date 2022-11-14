//
//  SessionsCoordinator.swift
//  controlsy
//
//  Created by Gabriel Matheus on 04/11/22.
//

import Foundation
import UIKit

class SessionsCoordinator: ChildCoordinatorProtocol {
    var navigation: UINavigationController
    weak var mainCoordinator: MainCoordinator?
    
    init(navigation: UINavigationController, mainCoordinator: MainCoordinator) {
        self.navigation = navigation
        self.mainCoordinator = mainCoordinator
    }
    
    func start() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .blue
        navigation.pushViewController(viewController, animated: true)
    }
}
