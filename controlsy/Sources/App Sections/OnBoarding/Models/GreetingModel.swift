//
//  GreetingModel.swift
//  controlsy
//
//  Created by Gabriel Matheus on 17/08/22.
//

import Foundation
import UIKit

struct GreetingModel {
    var greetingImageName: String
    var greetingTitle: String
    var greetingDescription: String
    
    func getGreetingImage() -> UIImage {
        return UIImage(named: self.greetingImageName) ?? UIImage()
    }
}
