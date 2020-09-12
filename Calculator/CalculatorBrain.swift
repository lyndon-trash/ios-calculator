//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by StartupBuilder.INFO on 9/12/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import SwiftUI

class CalculatorBrain: ObservableObject {
    
    static let instance = CalculatorBrain()
    
    @Published var accumulatedNumber = "0"
    
    private var isFinishedTypingNumber = true
    private var lastOperation: ButtonType?
    private var lastValue: Double = 0.0
    
    private init() {}
    
    var display: String {
        return accumulatedNumber
    }
    
    func press(button: ButtonType) {
        if button == .ac {
            reset()
        } else if button == .nega {
            negationPressed()
        } else if button == .percent {
            percentPressed()
        } else if button.isNumber {
            numericButtonPressed(button: button)
        } else if button.isOperation {
            operationButtonPressed(button: button)
        } else if button == .opEq {
            equalsPressed()
        }
    }
    
    private func reset() {
        isFinishedTypingNumber = true
        lastOperation = nil
        lastValue = 0.0
        accumulatedNumber = "0"
    }
    
    private func percentPressed() {
        let current = Double(accumulatedNumber)! * (0.01)
        accumulatedNumber = "\(current)"
    }
    
    private func negationPressed() {
        let current = Double(accumulatedNumber)! * (-1)
        accumulatedNumber = "\(current)"
    }
    
    private func numericButtonPressed(button: ButtonType) {
        assert(button.isNumber)
        
        if isFinishedTypingNumber {
            accumulatedNumber = button.display
            isFinishedTypingNumber = false
        } else {
            accumulatedNumber += button.display
        }
    }
    
    private func equalsPressed() {
        performLastOperation()
        accumulatedNumber = "\(lastValue)"
    }
    
    private func operationButtonPressed(button: ButtonType) {
        assert(button.isOperation)
        
        if lastOperation != nil {
            performLastOperation()
        } else {
            lastValue = Double(accumulatedNumber)!
            lastOperation = button
        }
        
        isFinishedTypingNumber = true
    }
    
    private func performLastOperation() {
        if let prevOp = lastOperation {
            switch prevOp {
            case .opPlus:
                lastValue = lastValue + Double(accumulatedNumber)!
            case .opMin:
                lastValue = lastValue - Double(accumulatedNumber)!
            case .opDiv:
                lastValue = lastValue / Double(accumulatedNumber)!
            case .opMul:
                lastValue = lastValue * Double(accumulatedNumber)!
            default:
                lastValue = Double(accumulatedNumber)! * 1
            }
        }
    }
    
}

enum ButtonType {
    
    var display: String {
        switch self {
        case .ac:
            return "AC"
        case .nega:
            return "+/-"
        case .n0:
            return "0"
        case .n1:
            return "1"
        case .n2:
            return "2"
        case .n3:
            return "3"
        case .n4:
            return "4"
        case .n5:
            return "5"
        case .n6:
            return "6"
        case .n7:
            return "7"
        case .n8:
            return "8"
        case .n9:
            return "9"
        case .opEq:
            return "="
        case .opPlus:
            return "+"
        case .opMin:
            return "-"
        case .opMul:
            return "x"
        case .opDiv:
            return "/"
        case .percent:
            return "P"
        case .dot:
            return "."
        }
    }
    
    var color: Color {
        switch self {
        case .ac, .nega, .percent:
            return .TopGray
        case .opDiv, .opMul, .opMin, .opPlus, .opEq:
            return .Orange
        default:
            return .BotGray
        }
    }
    
    var isNumber: Bool {
        switch self {
        case .n1, .n2, .n3, .n4, .n5, .n6, .n7, .n8, .n9, .n0:
            return true
        default:
            return false
        }
    }
    
    var isOperation: Bool {
        switch self {
        case .opDiv, .opMul, .opMin, .opPlus:
            return true
        default:
            return false
        }
    }
    
    case n1, n2, n3, n4, n5, n6, n7, n8, n9, n0
    case opDiv, opMul, opMin, opPlus
    case opEq
    case ac, dot, nega, percent
}
