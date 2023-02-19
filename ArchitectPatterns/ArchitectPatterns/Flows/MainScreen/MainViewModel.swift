//
//  MainViewModel.swift
//  ArchitectPatterns
//
//  Created by Степан Харитонов on 21.01.2023.
//

import Foundation
import UIKit

class MainViewModel: StoringViewModellable {
    var input: Input
    var output: Output
    var stringLabel: String = ""
    
    struct Input {
        var buttonClick: ActionVoid?
    }
    struct Output {
        var transAction: Action<Transitions>?
    }
    
    init() {
        self.input = Input(buttonClick: nil)
        self.output = Output(transAction: nil)
        bind()
    }
    
    private func bind() {
        input.buttonClick = { [weak self] in
            self?.output.transAction!(Transitions.push(.anotherViewController))
        }
    }
}
