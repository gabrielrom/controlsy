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
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        navigation.pushViewController(viewController, animated: false)
    }
}
