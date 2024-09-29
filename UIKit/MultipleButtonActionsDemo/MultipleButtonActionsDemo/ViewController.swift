//
//  ViewController.swift
//  MultipleButtonActionsDemo
//
//  Created by Ravi Shankar on 29/09/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: IBAction Methods
    
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        print("Touch ended inside the button")
    }
    
    @IBAction func buttonTouchUpOutside(_ sender: UIButton) {
        print("Touch ended outside the button")
    }
    
    @IBAction func buttonDragInside(_ sender: UIButton) {
        print("Drag inside the button")
    }
    
    @IBAction func buttonDragOutside(_ sender: UIButton) {
        print("Drag outside the button")
    }
}

