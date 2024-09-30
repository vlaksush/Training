//
//  StockTableViewCell.swift
//  IndianStockTracker
//
//  Created by Ravi Shankar on 30/09/24.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configure(with stock: Stock) {
        symbolLabel.text = stock.symbol
        nameLabel.text = stock.name
        priceLabel.text = String(format: "$%.2f", stock.price)
    }
}
