//
//  OnBoardingViewModel.swift
//  controlsy
//
//  Created by Gabriel Matheus on 24/08/22.
//

import Foundation
import RxRelay

enum OnBoardingSteps {
    case didSignUp
    case didSignIn
    case none
}

protocol OnBoardingViewModelProtocol {
    var selectedSteps: BehaviorRelay<OnBoardingSteps> { get set }
    
    func didTapOnSignUp()
    func didTapOnSignIn()
}

class OnBoardingViewModel: OnBoardingViewModelProtocol {
    var selectedSteps: BehaviorRelay<OnBoardingSteps> = BehaviorRelay<OnBoardingSteps>.init(value: .none)
    
    func didTapOnSignUp() {
        UserDefaults.standard.set("session", forKey: "access_type")
        selectedSteps.accept(.didSignUp)
    }
    
    func didTapOnSignIn() {
        UserDefaults.standard.set("session", forKey: "access_type")
        selectedSteps.accept(.didSignIn)
    }
}
