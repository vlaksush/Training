//
//  CurrencyViewModel.swift
//  CurrencyConverter
//
//  Created by Ravi Shankar on 06/10/24.
//

import Foundation

struct Currency:Identifiable, Hashable {
    var id: String {symbol}
    let name: String
    let symbol: String
    let conversionRate: Double
}

class CurrencyViewModel: ObservableObject {
    @Published var currencies:[Currency]
    @Published var selectedFromCurrency: Currency
    @Published var selectedToCurrency: Currency
    
    init() {
        currencies = [
            Currency(name: "US Dollar", symbol: "USD", conversionRate: 1.0),
            Currency(name: "Euro", symbol: "EUR", conversionRate: 0.84),
            Currency(name: "British Pound", symbol: "GBP", conversionRate: 0.72),
            Currency(name: "Japanese Yen", symbol: "JPY", conversionRate: 109.51),
        ]
        selectedFromCurrency =  Currency(name: "US Dollar", symbol: "USD", conversionRate: 1.0)
        selectedToCurrency = Currency(name: "Euro", symbol: "EUR", conversionRate: 0.84)
    }
    
    func convertedAmount(_ amount: String) -> Double {
        guard let amountDouble = Double(amount) else { return 0 }
        let inUSD = amountDouble / selectedFromCurrency.conversionRate
        return inUSD * selectedToCurrency.conversionRate
    }
    
    func swapCurrencies() {
        let temp = selectedFromCurrency
        selectedFromCurrency = selectedToCurrency
        selectedToCurrency = temp
    }
    
}
