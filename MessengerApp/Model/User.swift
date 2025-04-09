//
//  User.swift
//  MessengerApp
//
//  Created by Ian   on 08/04/2025.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id = NSUUID().uuidString
    let fullname: String
    let email: String
    var profileImageUrl: String?
}

extension User{
    static let MOCK_USER = User(fullname: "Kanye West", email: "ye@yeezy.com", profileImageUrl: "owl")
}
