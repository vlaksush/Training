//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Ravi Shankar on 01/10/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: CurrencyViewModel
    @State private var amount: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Amount to convert")) {
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("From")) {
                    Picker("From", selection: $viewModel.selectedFromCurrency) {
                        ForEach(viewModel.currencies) { currency in
                            Text(currency.name).tag(currency)
                        }
                    }
                }
                
                Section(header: Text("To")) {
                    Picker("To", selection: $viewModel.selectedToCurrency) {
                        ForEach(viewModel.currencies) { currency in
                            Text(currency.name).tag(currency)
                        }
                    }
                }
                
                Section(header: Text("Converted Amount")) {
                    Text("\(viewModel.convertedAmount(amount), specifier: "%.2f") \(viewModel.selectedToCurrency.symbol)")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                }
                
                Button(action: {
                    viewModel.swapCurrencies()
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
    ContentView(viewModel: CurrencyViewModel())
}
