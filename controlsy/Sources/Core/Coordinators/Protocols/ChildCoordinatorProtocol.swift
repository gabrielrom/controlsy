//
//  ChildCoordinator.swift
//  controlsy
//
//  Created by Gabriel Matheus on 04/11/22.
//

import Foundation
import UIKit
import RxRelay
import RxSwift

protocol ChildCoordinatorProtocol {
    var uniqueIdentifier: UUID { get }
    var navigation: UINavigationController? { get set }
    var rootViewController: UIViewController? { get set }
    var mainCoordinator: MainCoordinator? { get set }
    var selectedStep: BehaviorRelay<Step> { get }
    var disposeBag: DisposeBag? { get set }
    
    func start()
    func cleanCoordinator()
}
