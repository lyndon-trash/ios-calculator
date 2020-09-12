//
//  ContentView.swift
//  Calculator
//
//  Created by StartupBuilder.INFO on 9/10/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var calculator = CalculatorBrain.instance
    
    var body: some View {
        VStack(spacing: 1) {
            Text(calculator.display)
                .font(.largeTitle)
                .fontWeight(.light)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.white)
                .background(Color.DisplayGray)
            
            HStack(spacing: 1) {
                Presser(.ac)
                Presser(.nega)
                Presser(.percent)
                Presser(.opDiv)
            }
            
            HStack(spacing: 1) {
                Presser(.n7)
                Presser(.n8)
                Presser(.n9)
                Presser(.opMul)
            }
            
            HStack(spacing: 1) {
                Presser(.n4)
                Presser(.n5)
                Presser(.n6)
                Presser(.opMin)
            }
            
            HStack(spacing: 1) {
                Presser(.n1)
                Presser(.n2)
                Presser(.n3)
                Presser(.opPlus)
            }
            
            HStack(spacing: 1) {
                HStack {
                    Presser(.n0)
                }
                
                HStack(spacing: 1) {
                    Presser(.dot)
                    Presser(.opEq)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
    
    func pressed(buttonType: ButtonType) {
        
    }
}

struct Presser: View {
    
    let value: ButtonType
    let calculatorBrain = CalculatorBrain.instance
    
    init(_ buttonType: ButtonType) {
        value = buttonType
    }
    
    init() {
        value = .ac
    }
    
    var body: some View {
        Button(action: {
            self.calculatorBrain.press(button: self.value)
        }) {
            Text(value.display)
                .foregroundColor(.white)
                .font(.largeTitle)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(value.color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
