//
//  ContentView.swift
//  rps
//
//  Created by vaibhav mahajan on 1/2/23.
//

import SwiftUI

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat
    var result: Bool

    func effectValue(size: CGSize) -> ProjectionTransform {
        if result {
            return ProjectionTransform(CGAffineTransform(translationX: 0, y: 0))
        }
        else {
            return ProjectionTransform(CGAffineTransform(translationX:
                amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
                y: 0))
        }
    }
}

struct ContentView: View {
    static let values = ["Rock", "Paper", "Scissor"]
    static let conditions = ["Win", "Lose"]
    @State private var value = ContentView.values.randomElement()
    @State private var condition = ContentView.conditions.randomElement()
    @State private var attempts1: Int = 0
    @State private var attempts2: Int = 0
    @State private var attempts3: Int = 0
    @State private var isCorrect: Bool = false
    @State private var show: Bool = false
    @State private var totalPoints: Int = 0
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient.init(colors: [.white, .blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                Text("Choose the correct option to satisfy the condition")
                    .bold()
                    .font(.headline)
                    .foregroundColor(.red)
                    .padding()
                    .multilineTextAlignment(.center)
                    .fontDesign(.rounded)
                HStack {
                    Text(value ?? "NA")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.cyan)
                        .cornerRadius(10)
                        .frame(width: 100, height: 60, alignment: .center)
                        .shadow(radius: 10)
                    Text(condition ?? "NA")
                        .foregroundColor(.white)
                        .padding()
                        .background(condition == "Win" ? .green : .red)
                        .cornerRadius(10)
                        .frame(width: 100, height: 60, alignment: .center)
                        .shadow(radius: 10)
                }
                .padding(.bottom)
                
                
                Button(action: {
                    checkValue("Rock")
                    withAnimation(.default) {
                        self.attempts1 += 1
                    }
                    

                }, label: { Text("Rock")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                        .frame(width: 100, height: 70, alignment: .center)
                        .shadow(radius: 10) })
                .padding(.bottom)
                .modifier(Shake(animatableData: CGFloat(attempts1), result: isCorrect))
                
                
                Button(action: {
                    checkValue("Paper")
                    withAnimation(.default) {
                        self.attempts2 += 1
                    }
                    

                }, label: { Text("Paper")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                        .frame(width: 100, height: 70, alignment: .center)
                        .shadow(radius: 10) })
                .padding(.bottom)
                .modifier(Shake(animatableData: CGFloat(attempts2), result: isCorrect))
                
                
                Button {
                    checkValue("Scissor")
                    withAnimation(.default) {
                        self.attempts3 += 1
                    }
                    

                } label: { Text("Scissor")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                        .frame(width: 100, height: 70, alignment: .center)
                        .shadow(radius: 10)
                }
                .padding(.bottom)
                .modifier(Shake(animatableData: CGFloat(attempts3), result: isCorrect))
                
                if show {
                    Text(isCorrect ? "Correct" : "Incorrect")
                        .foregroundColor(isCorrect ? .indigo : .red)
                        .bold()
                        .font(.system(size: 36))

                    Text("Score is \(totalPoints)")
                }
                
                
                Spacer()
            }
            
        }
    }
    
    func checkValue(_ passedValue: String) {
        self.show = true
        let dct: [String : [String : String]] = ["Lose": ["Rock": "Scissor", "Paper": "Rock", "Scissor": "Paper"], "Win": ["Rock": "Paper", "Paper": "Scissor", "Scissor": "Rock"]]
        let correctValue: String = dct[self.condition ?? "NA"]?[self.value ?? "NA"] ?? "NA"
        if (passedValue == correctValue) {
            self.totalPoints += 1
            self.isCorrect = true
        }
        else {
            self.totalPoints -= 1
            self.isCorrect = false
        }
        refresh()
    }
    
    func refresh() {
        value = ContentView.values.randomElement()
        condition = ContentView.conditions.randomElement()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
