//
//  ViewController.swift
//  MyFirstAppUIKit
//
//  Created by Ravi Shankar on 20/09/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // This is called after the view controller's view has been loaded into memory.
    }

    @IBAction func pressMeButtonTapped(_ sender: UIButton) {
        welcomeLabel.text = "Button Pressed!"
    }
}

