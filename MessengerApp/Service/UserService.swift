//
//  UserService.swift
//  MessengerApp
//
//  Created by Ian   on 20/04/2025.
//

import Foundation
import FirebaseAuth

class UserService{
    
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    func fetchCurrentUser() async throws{
        guard let uid = Auth.auth().currentUser?.uid else {return}
    }
}
