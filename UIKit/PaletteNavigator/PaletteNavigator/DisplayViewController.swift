//
//  DisplayViewController.swift
//  PaletteNavigator
//
//  Created by Ravi Shankar on 30/09/24.
//

import UIKit

class DisplayViewController: UIViewController {
    
    var colour: MyColors?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let colour = colour {
            view.backgroundColor = colour.uiColor
            self.navigationItem.title = colour.displayName
        }
    }

}
