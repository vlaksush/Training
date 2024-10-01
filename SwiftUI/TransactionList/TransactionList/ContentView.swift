//
//  ContentView.swift
//  TransactionList
//
//  Created by Ravi Shankar on 01/10/24.
//

import SwiftUI

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


struct TransactionListView: View {
    @State private var transactions: [Transaction] = []
    @State private var isShowingAddTransaction = false
    
    var body: some View {
        NavigationView {
            List(transactions) { transaction in
                NavigationLink(destination:TransactionDetailView(transaction: transaction)) {
                    TransactionRowView(transaction: transaction)
                }
            }
            .navigationTitle("Transactions")
            .navigationBarItems(trailing: Button(action: {
                isShowingAddTransaction = true
            }) {
                Image(systemName: "plus")
            })
        }
        .onAppear {
            loadTransactions()
        }
        .refreshable {
            loadTransactions()
        }
        .sheet(isPresented: $isShowingAddTransaction) {
            AddTransactionView(transactions: $transactions)
        }
    }
    
    private func loadTransactions() {
        // Simulate API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.transactions = [
                Transaction(id: UUID(), date: Date().addingTimeInterval(-86400 * 2), amount: 120.50, description: "Grocery Shopping", type: .debit),
                Transaction(id: UUID(), date: Date().addingTimeInterval(-86400), amount: 1500.00, description: "Salary Deposit", type: .credit),
                Transaction(id: UUID(), date: Date().addingTimeInterval(-43200), amount: 65.00, description: "Restaurant Bill", type: .debit),
                Transaction(id: UUID(), date: Date().addingTimeInterval(-21600), amount: 200.00, description: "ATM Withdrawal", type: .debit),
                Transaction(id: UUID(), date: Date(), amount: 35.99, description: "Online Subscription", type: .debit),
                Transaction(id: UUID(), date: Date().addingTimeInterval(-129600), amount: 520.00, description: "Rent Payment", type: .debit),
                Transaction(id: UUID(), date: Date().addingTimeInterval(-172800), amount: 50.00, description: "Friend Transfer", type: .credit),
                Transaction(id: UUID(), date: Date().addingTimeInterval(-259200), amount: 80.75, description: "Utility Bill", type: .debit),
                Transaction(id: UUID(), date: Date().addingTimeInterval(-345600), amount: 160.00, description: "Clothing Purchase", type: .debit),
                Transaction(id: UUID(), date: Date().addingTimeInterval(-432000), amount: 1000.00, description: "Bonus Payment", type: .credit)
            ]
        }
    }
}

#Preview {
    TransactionListView()
}

struct TransactionRowView: View {
    
    let transaction: Transaction
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(transaction.description)
                    .font(.headline)
                Text(transaction.date, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(String(format: "$%.2f", transaction.amount))
                .foregroundColor(transaction.type == .credit ? .green : .red)
        }
    }
}
