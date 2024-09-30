//
//  SecondViewController.swift
//  StoryboardDemo
//
//  Created by Ravi Shankar on 30/09/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    var message: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let message = message {
            print(message)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? FirstViewController
        destination?.received = "Received"
    }
}
