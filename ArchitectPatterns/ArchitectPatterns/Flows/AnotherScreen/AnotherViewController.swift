//
//  AnotherViewController.swift
//  ArchitectPatterns
//
//  Created by Степан Харитонов on 10.01.2023.
//

import Foundation
import UIKit

class AnotherViewController: UIViewController {
    
    var viewModel: AnotherViewModel!
    @IBOutlet weak var textInput: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func OneButton(_ sender: Any) {
        viewModel.flag = false
        viewModel.input.buttonClick?()
    }
    
    @IBAction func TwoButton(_ sender: Any) {
        guard let text = textInput.text else { return }
        viewModel.bindString = text
        viewModel.flag = true
        viewModel.input.buttonClick?()
    }
}
