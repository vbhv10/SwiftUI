//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by vaibhav mahajan on 1/13/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: ObservableOrder
    @State private var confirmationMessage = ""
    @State private var showingAlert = false
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Placing Order")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank you!", isPresented: $showingAlert) {
            Button("OK") {}
        } message: {
            Text(confirmationMessage)
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order.order) else {
            print("Failed to encode order")
            return
        }
        
        var request = URLRequest(url: URL(string: "https://reqres.in/api/cupcakes")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let DecodedData = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(DecodedData.quantity)"
            showingAlert = true
        } catch {
            confirmationMessage = "Order placing failed"
            showingAlert = true
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: ObservableOrder(order: Order()))
    }
}
