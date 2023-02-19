//
//  AppCoordinator.swift
//  ArchitectPatterns
//
//  Created by Степан Харитонов on 10.01.2023.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    
    func start(window: UIWindow?)
    func performTransition(transition: Transitions)

}

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    func start(window: UIWindow?) {
        print("App Coordinator start")
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    
        // Toolbar Hidden on start
        navigationController?.isNavigationBarHidden = true
        
        navigationController?.pushViewController(getViewControllerByType(type: .mainViewController), animated: true)
    }
    
    private func getViewControllerByType(type: ViewControllers) -> UIViewController {
        var vc: UIViewController
        switch type {
            case .mainViewController:
                let configurator = MainScreenConfigurator()
                let myVc = configurator.configure()
                myVc.viewModel.output.transAction = {[weak self] trans in
                    self?.performTransition(transition: trans)
                }
                vc = myVc
            case .anotherViewController:
                let configurator = AnotherScreenConfigurator()
                let myVc = configurator.configure()
                myVc.viewModel.output.transAction = { [weak self] trans in
                    self?.performTransition(transition: trans)
                }
                vc = myVc
        }
        return vc
    }
    
    private func getViewControllerByTypeString(string: String) {
        let stack = navigationController?.viewControllers
        guard let vc = stack![0] as? MainViewController else { return }
        vc.viewModel.stringLabel = string
        
    }
    
    func performTransition(transition: Transitions) {
        switch transition {
            case .push(let viewController):
                let controller = getViewControllerByType(type: viewController)
                navigationController?.pushViewController(controller, animated: true)
            case .pop:
                navigationController?.popViewController(animated: true)
            case .alert:
                break
            case .pushString(withString: let withString):
                getViewControllerByTypeString(string: withString)
        }
    }
}
