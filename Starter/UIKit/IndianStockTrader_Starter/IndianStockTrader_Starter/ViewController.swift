//
//  ViewController.swift
//  IndianStockTrader_Starter
//
//  Created by Ravi Shankar on 12/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    // Array of tuples (symbol, name, price)
    var stocks: [(symbol: String, name: String, price: Double)] = [
        ("RELIANCE", "Reliance Industries Ltd.", 2450.75),
        ("TCS", "Tata Consultancy Services Ltd.", 3320.50),
        ("HDFCBANK", "HDFC Bank Ltd.", 1580.25),
        ("INFY", "Infosys Ltd.", 1620.80),
        ("HINDUNILVR", "Hindustan Unilever Ltd.", 2680.30),
        ("ICICIBANK", "ICICI Bank Ltd.", 750.45),
        ("SBIN", "State Bank of India", 520.90),
        ("BHARTIARTL", "Bharti Airtel Ltd.", 710.15),
        ("ITC", "ITC Ltd.", 240.60),
        ("KOTAKBANK", "Kotak Mahindra Bank Ltd.", 1890.70)
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

