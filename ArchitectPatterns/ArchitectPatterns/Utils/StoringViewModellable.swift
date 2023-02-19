//
//  StoringViewModellable.swift
//  ArchitectPatterns
//
//  Created by Степан Харитонов on 15.01.2023.
//

import Foundation

protocol StoringViewModellable: ViewModellable {
    var input: Input { get }
    var output: Output { get }
}
