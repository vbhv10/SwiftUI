//
//  ExpenseItem.swift
//  iExpense
//
//  Created by vaibhav mahajan on 1/10/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
