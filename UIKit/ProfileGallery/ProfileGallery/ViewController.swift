//
//  ViewController.swift
//  ProfileGallery
//
//  Created by Ravi Shankar on 14/11/24.
//

import UIKit

struct Participant {
    let id: UUID
    let name: String
    let imageUrl: String
    
    static let sampleData = [
        Participant(id: UUID(), name: "Arjun Kumar", imageUrl: "person.circle.fill"),
        Participant(id: UUID(), name: "Priya Sharma", imageUrl: "person.circle.fill"),
        Participant(id: UUID(), name: "Rahul Patel", imageUrl: "person.circle.fill"),
        Participant(id: UUID(), name: "Anjali Verma", imageUrl: "person.circle.fill"),
        Participant(id: UUID(), name: "Vikram Singh", imageUrl: "person.circle.fill"),
        Participant(id: UUID(), name: "Neha Gupta", imageUrl: "person.circle.fill"),
        Participant(id: UUID(), name: "Aditya Reddy", imageUrl: "person.circle.fill"),
        Participant(id: UUID(), name: "Kavita Iyer", imageUrl: "person.circle.fill"),
        Participant(id: UUID(), name: "Raj Malhotra", imageUrl: "person.circle.fill"),
        Participant(id: UUID(), name: "Meera Desai", imageUrl: "person.circle.fill")
    ]
}


class ViewController: UIViewController {
    @IBOutlet private var collectionView: UICollectionView!
    private var participants = Participant.sampleData
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
}

// MARK: - UICollectionView DataSource & Delegate
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return participants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ParticipantViewCell.identifier, for: indexPath) as? ParticipantViewCell else {
            return UICollectionViewCell()
        }
        
        let participant = participants[indexPath.item]
        cell.configure(with: participant)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 30) / 2 // 2 spaces of 10 points each
        return CGSize(width: width, height: 120)
    }
}

