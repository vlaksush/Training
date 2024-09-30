//
//  ViewController.swift
//  StoryboardDemo
//
//  Created by Ravi Shankar on 30/09/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    var received: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinaton = segue.destination as? SecondViewController
        destinaton?.message = "Welcome"
    }

    @IBAction func unwind(segue: UIStoryboardSegue) {
        print(received ?? "No Value")
    }
    
    @IBAction func noSegue(sender: UIButton) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            controller.message = "Non Segue Call"
           // present(controller, animated: true)
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}

