//
//  ExchangeRateService.swift
//  CurrencyConverter
//
//  Created by Ravi Shankar on 07/10/24.
//

import Foundation

struct ExchangeRatesResponse: Codable {
    let rates: [String: Double]
}

class ExchangeRateService {
    
    static let shared = ExchangeRateService()
    
    private init() {}
    
    let API_URL = "https://open.er-api.com/v6/latest/USD"
        
    // Predefined list of currencies we want to support
    let supportedCurrencies = [
        "USD": "US Dollar",
        "EUR": "Euro",
        "GBP": "British Pound",
        "JPY": "Japanese Yen",
        "INR": "Indian Rupees"
    ]
    
    func fetchRates() async throws -> [Currency] {
        let session = URLSession.shared
        
        guard let url = URL(string: API_URL) else {
            throw URLError(.badURL)
        }
        
        let request = URLRequest(url:url)
        
        let (data, _) = try await session.data(for: request)
        
        return try parseJSON(data: data)
    }
    
    private func parseJSON(data: Data) throws -> [Currency] {
        let decoder = JSONDecoder()
        let result = try decoder.decode(ExchangeRatesResponse.self, from: data)
        
        return supportedCurrencies.compactMap { (symbol, name) in
            guard let rate = result.rates[symbol] else { return nil }
            return Currency(name: name, symbol: symbol, conversionRate: rate)
        }
    }
}
