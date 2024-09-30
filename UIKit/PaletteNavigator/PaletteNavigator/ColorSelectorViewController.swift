//
//  ViewController.swift
//  PaletteNavigator
//
//

import UIKit

class ColorSelectorViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    // tableview - list all data
    // prepare for segue, for passing selected colur.
    // create viewcontroller
    
    let myColours: [MyColors] = MyColors.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Colour Selector"
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as?  DisplayViewController
        if let index = tableView.indexPathForSelectedRow {
            destination?.colour = myColours[index.row]
        }
    }
}

extension ColorSelectorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myColours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColourCell", for: indexPath)
        
        let colour = myColours[indexPath.row]
        
        cell.textLabel?.text = colour.displayName
        return cell
    }
}

