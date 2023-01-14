//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by vaibhav mahajan on 1/12/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var order = ObservableOrder(order: Order())
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.order.type) {
                        ForEach(0..<Order.types.count, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number fo cakes : \(order.order.quantity)", value: $order.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Is Special requests?", isOn: $order.order.specialRequestEnabled.animation())
                    
                    if order.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery Details")
                    }
                }
                
            }
            .navigationTitle("Cupcake corner")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
