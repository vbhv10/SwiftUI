//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by vaibhav mahajan on 1/13/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: ObservableOrder
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.order.name)
                TextField("Street Address", text: $order.order.streetAddress)
                TextField("City", text: $order.order.city)
                TextField("Zip", text: $order.order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Checkout details")
                }
            }
            .disabled(!order.order.hasValidAddress)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(order: ObservableOrder(order: Order()))
        }
        
    }
}
