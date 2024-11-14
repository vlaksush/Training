//
//  ViewController.swift
//  PhotoGallery
//
//  Created by Ravi Shankar on 14/11/24.
//

import UIKit

struct Photo {
    let name: String
}

class ViewController: UIViewController {
    @IBOutlet private var collectionView: UICollectionView!
    
    let photos = (1...20).map { Photo(name: "photo\($0)") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        let photo = photos[indexPath.row]
        cell.imageView.frame.size = cell.frame.size
        cell.imageView.image = UIImage(named: photo.name)
        return cell
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout    {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       let width = (view.frame.width - 20) / 2
        return CGSize(width: width, height: width)
    }
}

extension ViewController:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = photos[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(identifier: "PhotoViewController") as? PhotoViewController {
            vc.photo = photo
            present(vc, animated: true, completion: nil)
        }
  
    }
}

