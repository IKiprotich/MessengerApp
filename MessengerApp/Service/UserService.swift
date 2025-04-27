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
    
    @MainActor
    func fetchCurrentUser() async throws{
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
       
    }
    

    static func fetchAllUsers() async throws -> [User]{
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as:User.self)})
        
    }
    
    static func fetchUser(withUid uid: String, completion: @escaping(User) -> Void){
        FirestoreConstants.UserCollection.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as:User.self) else { return }
            completion(user)
                
            }
    }
}
