//
//  AnimateButton.swift
//  RSPulse
//
//  Created by Ravi Shankar on 08/10/24.
//

import SwiftUI

public struct AnimateButton: View {
    
    
    public typealias UserAction = (() -> Void)
    
    private let text: String
    private let systemImageName: String?
    private let action: UserAction
    
    public init(text: String, systemImageName: String? = nil, action: @escaping UserAction) {
        self.text = text
        self.systemImageName = systemImageName
        self.action = action
    }
    
    
    public var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                if let imageName = systemImageName {
                    Image(systemName: imageName)
                }
                Text(text)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .buttonStyle(InteractiveButtonStyle())
    }
}

struct InteractiveButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? Color.orange : Color.green)
            .cornerRadius(10)
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(.white)
    }
}

#Preview {
    AnimateButton(text: "Refresh") {
        print("Preview")
    }
}
