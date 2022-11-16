//
//  SessionsCoordinator.swift
//  controlsy
//
//  Created by Gabriel Matheus on 04/11/22.
//

import Foundation
import UIKit
import RxRelay
import RxSwift

class SessionsCoordinator: ChildCoordinatorProtocol {
    weak var mainCoordinator: MainCoordinator?
    
    var uniqueIdentifier: UUID = UUID()
    var navigation: UINavigationController?
    var rootViewController: UIViewController?
    
    var selectedStep: BehaviorRelay<Step> = BehaviorRelay<Step>(value: .none)
    var disposeBag: DisposeBag?
    
    init(navigation: UINavigationController, mainCoordinator: MainCoordinator) {
        self.navigation = navigation
        self.mainCoordinator = mainCoordinator
    }
    
    func start() {
        guard let navigation = navigation else { return }

        let viewController = UIViewController()
        viewController.view.backgroundColor = .blue
        navigation.pushViewController(viewController, animated: true)
    }
    
    func cleanCoordinator() { }
}
