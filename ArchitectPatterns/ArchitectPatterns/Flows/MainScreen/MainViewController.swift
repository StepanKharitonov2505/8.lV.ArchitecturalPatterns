//
//  ViewController.swift
//  ArchitectPatterns
//
//  Created by Степан Харитонов on 10.01.2023.
//

import UIKit

class MainViewController: UIViewController {

    var viewModel: MainViewModel!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.textLabel.text = viewModel.stringLabel
    }

    @IBAction func MainButton(_ sender: Any) {
        viewModel.input.buttonClick?()
    }
}

