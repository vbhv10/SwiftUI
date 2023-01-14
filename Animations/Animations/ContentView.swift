//
//  ContentView.swift
//  Animations
//
//  Created by vaibhav mahajan on 1/4/23.
//

import SwiftUI

struct ContentView: View {
    let words = Array("Hello World")
    @State private var animationAmount = 0.0
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    var body: some View {
        ZStack {
            VStack {
                //            List {
                //                Button("tap me!") {
                //                    withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                //                        animationAmount += 360
                //                    }
                //                }
                //                .padding(50)
                //                .background(.red)
                //                .foregroundColor(.white)
                //                .clipShape(Circle())
                //                .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 1, z: 1))
                //
                //                Button("tap me!") {
                //                    enabled.toggle()
                //                }
                //                .frame(width: 100, height: 100)
                //                .background(enabled ? .blue : .red)
                //                .foregroundColor(.white)
                //                .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
                //                .animation(.easeInOut(duration: 1), value: enabled)
                //
                //
                //            }
                LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: 300, height: 200, alignment: .top)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged {
                                dragAmount = $0.translation
                            }
                            .onEnded {_ in
                                withAnimation {
                                    dragAmount = .zero
                                }
                            }
                    )
                HStack(spacing: 0) {
                    ForEach(0..<words.count) { num in
                        Text(String(words[num]))
                            .padding(5)
                            .font(.title)
                            .background(enabled ? .blue : .red)
                            .offset(dragAmount)
                            .animation(.default.delay(Double(num) / 20), value: dragAmount)
                    }
                }
                .gesture(
                    DragGesture()
                        .onChanged{dragAmount = $0.translation}
                        .onEnded {_ in
                            withAnimation {
                                dragAmount = .zero
                            }
                        }
                )
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
