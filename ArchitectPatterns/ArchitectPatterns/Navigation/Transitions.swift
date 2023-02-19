//
//  Transitions.swift
//  ArchitectPatterns
//
//  Created by Степан Харитонов on 10.01.2023.
//

import Foundation

enum Transitions {
    case push(ViewControllers)
    case pushString(withString: String)
    case pop
    case alert
}
