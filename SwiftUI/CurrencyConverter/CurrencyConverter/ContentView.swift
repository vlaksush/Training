//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Ravi Shankar on 01/10/24.
//

import SwiftUI

struct Currency:Identifiable, Hashable {
    let id = UUID()
    let name: String
    let symbol: String
    let conversionRate: Double
}

let currencies = [
    Currency(name: "US Dollar", symbol: "USD", conversionRate: 1.0),
    Currency(name: "Euro", symbol: "EUR", conversionRate: 0.84),
    Currency(name: "British Pound", symbol: "GBP", conversionRate: 0.72),
    Currency(name: "Japanese Yen", symbol: "JPY", conversionRate: 109.51),
]

struct ContentView: View {
    
    @State private var amount: String = ""
    @State private var selectedFromCurrency = currencies[0]
    @State private var selectedToCurrency = currencies[1]
    
    
    private var convertedAmount: Double {
        guard let amountDouble = Double(amount) else { return 0 }
        let inUSD = amountDouble / selectedFromCurrency.conversionRate
        return inUSD * selectedToCurrency.conversionRate
    }
    
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Amount to convert")) {
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("From")) {
                    Picker("From", selection: $selectedFromCurrency) {
                        ForEach(currencies) { currency in
                            Text(currency.name).tag(currency)
                        }
                    }
                }
                
                Section(header: Text("To")) {
                    Picker("To", selection: $selectedToCurrency) {
                        ForEach(currencies) { currency in
                            Text(currency.name).tag(currency)
                        }
                    }
                }
                
                Section(header: Text("Converted Amount")) {
                    Text("\(convertedAmount, specifier: "%.2f") \(selectedToCurrency.symbol)")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                }
                
                Button(action: {
                    let temp = selectedFromCurrency
                    selectedFromCurrency = selectedToCurrency
                    selectedToCurrency = temp
                }) {
                    HStack {
                        Image(systemName: "arrow.left.arrow.right")
                        Text("Swap Currencies")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
                .buttonStyle(InteractiveButtonStyle())
 
            }
        }
        .padding()
    }
}

struct InteractiveButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? Color.orange : Color.green)
            .cornerRadius(10)
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(.white)
    }
}

#Preview {
    ContentView()
}
