//
//  OnBoardingCoordinator.swift
//  controlsy
//
//  Created by Gabriel Matheus on 04/11/22.
//

import Foundation
import UIKit

class OnBoardingCoordinator: ChildCoordinatorProtocol {
    var navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        let viewController = OnBoardingViewController()
        self.navigation.pushViewController(viewController, animated: false)
    }
}
