//
//  ParticipantViewCell.swift
//  ProfileGallery
//
//  Created by Ravi Shankar on 14/11/24.
//

import UIKit

class ParticipantViewCell: UICollectionViewCell {
    @IBOutlet private var nameLabel: UILabel!
    
    static let identifier = "ParticipantCell"
    
    func configure(with participant: Participant) {
        nameLabel.text = participant.name
    }
}
