//
//  ContentView.swift
//  Guess the flag
//
//  Created by vaibhav mahajan on 12/26/22.
//

import SwiftUI

struct ContentView: View {
    let countries = ["India", "Pakistan", "France", "Canada", "Egypt"].shuffled()
    let selected = Int.random(in: 0...2)
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .top, endPoint: .bottom)
                .padding(100)
            RadialGradient(gradient: Gradient(colors: [.purple, .black]), center: .bottom, startRadius: 10, endRadius: 25)
                .frame(width: 100, height: 100)
            Text("Jai shree ram")
                .padding(50)
                .background(.ultraThinMaterial)
                .foregroundColor(.secondary)
            Color.blue.ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Text("Select the flag of").foregroundColor(.white)
                    Text(countries[selected]).foregroundColor(.white)
                }
                
                ForEach(0..<3) { number in
                    Button {
                        
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                    }
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
