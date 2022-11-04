//
//  Greetings+Utils.swift
//  controlsy
//
//  Created by Gabriel Matheus on 04/11/22.
//

import Foundation

enum GreetingsType {
    case normal
    case premium
    
    var data: [GreetingModel] {
        switch self {
        case .normal:
            return [GreetingModel(greetingImageName: "plan-finances",
                                 greetingTitle: "PLAN YOUR FINANCES",
                                 greetingDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since th"),
                   GreetingModel(greetingImageName: "save-money",
                                 greetingTitle: "CONTROL YOUR SAVINGS",
                                 greetingDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since th"),
                   GreetingModel(greetingImageName: "watch-investments",
                                 greetingTitle: "WATCH YOUR INVESTMENTS",
                                 greetingDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since th")]
        case .premium:
            return [GreetingModel(greetingImageName: "plan-finances",
                                  greetingTitle: "PLAN YOUR FINANCES",
                                  greetingDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since th")]
        }
    }
}
