//
//  ViewController.swift
//  IndianStockTracker
//
//  Created by Ravi Shankar on 30/09/24.
//

import UIKit

class StockTrackerViewController: UITableViewController {
    
    let stockManager = StockManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        stockManager.delegate = self
    }
    
    func setupUI() {
        self.navigationItem.title = "Indian Stock Tracker"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemIndigo]
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        
        // Add Bar Button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action:  #selector(refreshButtonTapped))
    }
    
    @objc func refreshButtonTapped(_ sender: UIBarButtonItem) {
        // Simulate price updates
        
        stockManager.refreshPrices()
    }
}

extension StockTrackerViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockManager.stocks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockCell", for: indexPath) as! StockTableViewCell
        
        let stock = stockManager.stocks[indexPath.row]
        
        cell.configure(with: stock)
        
        return cell
    }
}

extension StockTrackerViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}

extension StockTrackerViewController: StockManagerDelegate {
    func didUpdatePrice(stockManager: StockManager) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
