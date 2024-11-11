//
//  ViewController.swift
//  MyFirstAppUIKit
//
//  Created by Ravi Shankar on 11/11/24.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - UI Components
    private let textField: UITextField = {
        let field = UITextField()
        field.borderStyle = .line
        field.placeholder = "Enter text"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.textColor = .red
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tapMeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap me", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .white
        
        // Add subviews
        view.addSubview(textField)
        view.addSubview(welcomeLabel)
        view.addSubview(tapMeButton)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            
            // Welcome label constraints
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            // TextField constraints
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.bottomAnchor.constraint(equalTo: welcomeLabel.topAnchor, constant: -30),
        
            // Tap Me button constraints
            tapMeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tapMeButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 30),
        ])
    }
    
    private func setupActions() {
        tapMeButton.addTarget(self, action: #selector(tapMeButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func tapMeButtonTapped() {
        guard let text = textField.text, !text.isEmpty else { return }
        welcomeLabel.text = text
    }
}


