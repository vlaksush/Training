//
//  StockManager.swift
//  IndianStockTracker
//
//  Created by Ravi Shankar on 30/09/24.
//

import Foundation

struct Stock {
    let symbol: String
    let name: String
    var price: Double
}

protocol StockManagerDelegate: AnyObject {
    func didUpdatePrice(stockManager: StockManager)
}

class StockManager {
    
    weak var delegate: StockManagerDelegate?
    
    var stocks = [
        Stock(symbol: "RELIANCE", name: "Reliance Industries Ltd.", price: 2450.75),
        Stock(symbol: "TCS", name: "Tata Consultancy Services Ltd.", price: 3320.50),
        Stock(symbol: "HDFCBANK", name: "HDFC Bank Ltd.", price: 1580.25),
        Stock(symbol: "INFY", name: "Infosys Ltd.", price: 1620.80),
        Stock(symbol: "HINDUNILVR", name: "Hindustan Unilever Ltd.", price: 2680.30),
        Stock(symbol: "ICICIBANK", name: "ICICI Bank Ltd.", price: 750.45),
        Stock(symbol: "SBIN", name: "State Bank of India", price: 520.90),
        Stock(symbol: "BHARTIARTL", name: "Bharti Airtel Ltd.", price: 710.15),
        Stock(symbol: "ITC", name: "ITC Ltd.", price: 240.60),
        Stock(symbol: "KOTAKBANK", name: "Kotak Mahindra Bank Ltd.", price: 1890.70)
    ]
    
    func refreshPrices() {
        for i in 0..<stocks.count {
            let randomChange = Double.random(in: -5...5)
            stocks[i].price += randomChange
        }
        
        delegate?.didUpdatePrice(stockManager: self)
    }
}

