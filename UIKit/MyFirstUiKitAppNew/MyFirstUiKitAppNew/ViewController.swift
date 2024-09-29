//
//  ViewController.swift
//  MyFirstUiKitAppNew
//
//  Created by Ravi Shankar on 27/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var textMessage: UITextField!
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func displayMessage(_ sender: Any) {
        
        let welcomeMessage = "Welcome"
        
        print(welcomeMessage)
        
        messageLabel.text = textMessage.text
    }
}

