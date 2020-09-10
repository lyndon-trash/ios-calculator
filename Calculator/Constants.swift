//
//  Constants.swift
//  Calculator
//
//  Created by StartupBuilder.INFO on 9/10/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import SwiftUI

extension Color {
    static let BotGray = Color("BBotGray")
    static let DisplayGray = Color("BDisplayGray")
    static let TopGray = Color("BTopGray")
    static let Orange = Color("BOrange")
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
            return "%"
        case .modulo:
            return "%"
        case .dot:
            return "."
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
    
    var color: Color {
        switch self {
        case .ac, .nega, .modulo:
            return .TopGray
        case .opDiv, .opMul, .opMin, .opPlus, .opEq:
            return .Orange
        default:
            return .BotGray
        }
    }
    
    case n1, n2, n3, n4, n5, n6, n7, n8, n9, n0
    case opDiv, opMul, opMin, opPlus, opEq
    case ac, dot, nega, modulo
}

struct Constants_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
