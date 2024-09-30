//
//  ThirdViewController.swift
//  AutoLayoutDemo
//
//  Created by Ravi Shankar on 30/09/24.
//

import UIKit

class ThirdViewController: UIViewController {
    
    private let nameLabel = UILabel()
    private let nameTextField = UITextField()
    private let ageLabel = UILabel()
    private let ageTextField = UITextField()
    private let submitButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // Name Label
        nameLabel.text = "Name:"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        // Name TextField
        nameTextField.borderStyle = .roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        // Age Label
        ageLabel.text = "Age:"
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ageLabel)
        
        // Age TextField
        ageTextField.borderStyle = .roundedRect
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ageTextField)
        
        // Submit Button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Name Label
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.widthAnchor.constraint(equalToConstant: 60),  // Fixed width for label
            
            // Name TextField
            nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 30),  // Fixed height for text field
            
            // Age Label
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            ageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ageLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),  // Same width as name label
            
            // Age TextField
            ageTextField.topAnchor.constraint(equalTo: ageLabel.topAnchor),
            ageTextField.leadingAnchor.constraint(equalTo: ageLabel.trailingAnchor, constant: 8),
            ageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ageTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),  // Same height as name text field
            
            // Submit Button
            submitButton.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
}
