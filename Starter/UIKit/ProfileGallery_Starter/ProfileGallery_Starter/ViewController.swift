//
//  ViewController.swift
//  ProfileGallery_Starter
//
//  Created by Ravi Shankar on 12/11/24.
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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

