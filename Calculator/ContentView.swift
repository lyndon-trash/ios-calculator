//
//  ContentView.swift
//  Calculator
//
//  Created by StartupBuilder.INFO on 9/10/20.
//  Copyright © 2020 StartupBuilder.INFO. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 1) {
            Text("0")
                .font(.largeTitle)
                .fontWeight(.light)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.white)
                .background(Color.DisplayGray)
            
            HStack(spacing: 1) {
                Presser(value: "AC")
                Presser()
                Presser()
                Presser()
            }
            
            HStack(spacing: 1) {
                Presser()
                Presser()
                Presser()
                Presser()
            }
            
            HStack(spacing: 1) {
                Presser()
                Presser()
                Presser()
                Presser()
            }
            
            HStack(spacing: 1) {
                Presser()
                Presser()
                Presser()
                Presser()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct Presser: View {
    
    var value: String?
    
    var body: some View {
        Button(action: {
            
        }) {
            Text(value ?? "??")
                .foregroundColor(.white)
                .font(.largeTitle)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.BotGray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
