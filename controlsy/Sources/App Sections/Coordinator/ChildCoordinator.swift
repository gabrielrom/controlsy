//
//  ChildCoordinator.swift
//  controlsy
//
//  Created by Gabriel Matheus on 04/11/22.
//

import Foundation
import UIKit

protocol ChildCoordinatorProtocol {
    var navigation: UINavigationController { get }
    func start()
}
