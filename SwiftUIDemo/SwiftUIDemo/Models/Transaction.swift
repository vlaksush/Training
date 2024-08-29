//
//  Transaction.swift
//  SwiftUIDemo
//
//  Created by Ravi Shankar on 29/08/24.
//

import Foundation

struct Transaction: Identifiable {
    let id: UUID
    let date: Date
    let amount: Double
    let description: String
    let type: TransactionType
}

enum TransactionType {
    case credit, debit
}
