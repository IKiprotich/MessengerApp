//
//  User.swift
//  MessengerApp
//
//  Created by Ian   on 08/04/2025.
//

import Foundation
import FirebaseFirestore

struct User: Codable, Identifiable, Hashable {
    @DocumentID var uid: String?
    let fullname: String
    let email: String
    var profileImageUrl: String?
    
    var id:String{
        return uid ?? NSUUID().uuidString
    }
}

extension User{
    static let MOCK_USER = User(fullname: "Kanye West", email: "ye@yeezy.com", profileImageUrl: "owl")
}
