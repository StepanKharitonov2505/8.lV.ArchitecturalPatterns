//
//  AnotherViewModel.swift
//  ArchitectPatterns
//
//  Created by Степан Харитонов on 10.01.2023.
//

import Foundation
import UIKit

class AnotherViewModel: StoringViewModellable {
    var input: Input
    var output: Output
    var bindString: String = ""
    var flag: Bool = false
    
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
            if self?.flag != true {
                self?.output.transAction!(Transitions.pop)
            } else {
                self?.output.transAction!(Transitions.pushString(withString: self!.bindString))
            }
        }
    }

}
