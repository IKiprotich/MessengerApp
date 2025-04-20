//
//  UserService.swift
//  MessengerApp
//
//  Created by Ian   on 20/04/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class UserService{
    
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    func fetchCurrentUser() async throws{
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print("DEBUG: Current user in service is \(currentUser)")
    }
}
