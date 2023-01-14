//
//  ContentView.swift
//  WeSplit
//
//  Created by vaibhav mahajan on 12/24/22.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    @State private var selectedName = "Nalin"
    @State private var amount = 0.0
    @State private var people = 2
    @State private var tipAmount = 20
    @FocusState private var amountFocused: Bool
    var nameList = ["Amit", "Avi", "Nalin", "Vaibhav"]
    var totalSplit: [Double] {
        let tipCalculate = Double(tipAmount)
        let peopleCalculate = Double(people + 2)
        let totalTip = amount / 100 * tipCalculate
        let totalPerPerson  = (totalTip + amount) / peopleCalculate
        
        return [totalPerPerson, (totalTip + amount)]
    }
    
    var currencyFormatter: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currencyCode ?? "USD")
    }
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    TextField("Enter Your name", text: $name)
                    Section  {
                        Picker("Select People", selection: $people) {
                            ForEach(2..<100) {
                                Text("\($0) people")
                            }
                        }
                    }
                    Section {
                        Text("Hello World")
                        Button("tap count \(tapCount)") {
                            tapCount += 1
                        }
                        .font(.headline)
                        
                        Picker("Select the name", selection: $selectedName) {
                            ForEach(nameList, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    Section {
                        TextField("Enter Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .keyboardType(.decimalPad)
                            .focused($amountFocused)
                    }
                    
                    Section {
                        Text(amount, format: currencyFormatter)
                    }
                    
                    Section {
                        Picker("Amount", selection: $tipAmount) {
                            ForEach(0..<101) {
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                    header: {
                        Text("Tip you wanna leave")
                    }
                    
                    
                    Section {
                        Text(totalSplit[1], format: currencyFormatter)
                    } header: {
                        Text("Total Amount")
                    }
                    
                    Section {
                        Text(totalSplit[0], format: currencyFormatter)
                    } header: {
                        Text("Amount per person")
                    }
                }
                .navigationTitle("Ammaoda")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            amountFocused = false
                        }
                    }
                }
                
            }
            
        }
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.medium)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
