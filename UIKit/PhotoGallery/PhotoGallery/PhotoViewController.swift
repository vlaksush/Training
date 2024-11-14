//
//  PhotoViewController.swift
//  PhotoGallery
//
//  Created by Ravi Shankar on 14/11/24.
//


import UIKit

class PhotoViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    
    var photo: Photo?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let photo = photo {
            imageView.image = UIImage(named: photo.name)
            imageView.contentMode = .scaleAspectFit
        }
    }
    
}
