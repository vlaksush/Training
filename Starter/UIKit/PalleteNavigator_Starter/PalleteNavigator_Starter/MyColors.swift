//
//  MyColors.swift
//  PalleteNavigator_Starter
//
//  Created by Ravi Shankar on 11/11/24.
//

import UIKit

enum MyColors: String, CaseIterable {
    case blue, cyan, green, orange, red, yellow, purple, gray

    var displayName: String {
        rawValue.capitalized
    }
    
    var uiColor: UIColor {
        switch self {
        case .blue: return .blue
        case .cyan: return .cyan
        case .green: return .green
        case .orange: return .orange
        case .red: return .red
        case .yellow: return .yellow
        case .purple: return .purple
        case .gray: return .gray
        }
    }

    static func colour(at index: Int) -> MyColors? {
        guard index >= 0, index < allCases.count else { return nil }
        return allCases[index]
    }
}
