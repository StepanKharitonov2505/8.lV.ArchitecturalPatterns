//
//  MainScreenConfigurator.swift
//  ArchitectPatterns
//
//  Created by Степан Харитонов on 10.01.2023.
//

import Foundation
import UIKit

class MainScreenConfigurator {
    func configure() -> MainViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        vc.viewModel = MainViewModel()
        return vc
    }
}
