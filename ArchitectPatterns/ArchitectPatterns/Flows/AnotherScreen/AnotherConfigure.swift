//
//  AnotherConfigure.swift
//  ArchitectPatterns
//
//  Created by Степан Харитонов on 10.01.2023.
//

import Foundation
import UIKit

class AnotherScreenConfigurator {
    func configure() -> AnotherViewController {
        let storyboard = UIStoryboard.init(name: "AnotherStoryboard", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "AnotherViewController") as! AnotherViewController
        vc.viewModel = AnotherViewModel()
        return vc
    }
}
