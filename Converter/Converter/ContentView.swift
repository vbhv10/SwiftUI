//
//  ContentView.swift
//  Converter
//
//  Created by vaibhav mahajan on 12/26/22.
//

import SwiftUI

struct ContentView: View {
    @State private var fromTempUnit = "Celsius"
    @State private var toTempUnit = "Celsius"
    @State private var toConvert = 0.0
    var afterConvert: Float {
        var returnValue : Float
        switch (fromTempUnit) {
            case "Fahrenheit" :
                returnValue = Float((toConvert - 32) * 5 / 9)
            case "Kelvin" :
                returnValue = Float((toConvert - 273.15))
            default:
                returnValue = Float(toConvert)
        }
        
        switch (toTempUnit) {
            case "Fahrenheit" :
                returnValue = Float((returnValue * 9 / 5 + 32))
            case "Kelvin" :
                returnValue = Float((returnValue + 273.15))
            default:
                print("")
        }
        return returnValue
        
            
    }
    @FocusState private var isFocused : Bool
    let tempUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section {
                        Picker("Select the temperature type", selection: $fromTempUnit) {
                            ForEach(tempUnits, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                        
                        TextField("Enter the temperature", value: $toConvert, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($isFocused)
                    }
                    Section {
                        Picker("Temperature after convert", selection: $toTempUnit) {
                            ForEach(tempUnits, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                        
                        Text(afterConvert, format: .number)
                    }
                }
                .navigationTitle("Converter")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isFocused = false
                        }
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
