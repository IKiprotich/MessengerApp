//
//  SettingsOptionViewModel.swift
//  MessengerApp
//
//  Created by Ian   on 06/04/2025.
//

import Foundation
import SwiftUICore
enum SettingsOptionViewModel: Int, CaseIterable, Identifiable {
    case darkmode
    case activeStatus
    case accesibility
    case privacy
    case notifications
    
    var title: String {
        switch self {
        case .darkmode:
            return "Dark Mode"
        case .activeStatus:
            return "Active Status"
        case .accesibility:
            return "Accessibility"
        case .privacy:
            return "Privacy"
        case .notifications:
            return "Notifications"
        }
    }
    
    var imageName: String {
        switch self {
        case .darkmode:
            return "moon.circle.fill"
        case .activeStatus:
            return "message.badge.circle.fill"
        case .accesibility:
            return "person.circle.fill"
        case .privacy:
            return "lock.circle.fill"
        case .notifications:
            return "bell.circle.fill"
        }
    }
    
    var imageBackgroundColor: Color {
        switch self {
        case .darkmode:
            return Color.theme.primaryText
        case .activeStatus:
            return Color(.systemGreen)
        case .accesibility:
            return Color.theme.primaryText
        case .privacy:
            return Color(.systemBlue)
        case .notifications:
            return Color(.systemPurple)
        }
    }
    
    
    
    var id: Int {
        return self.rawValue
    }
    
}
