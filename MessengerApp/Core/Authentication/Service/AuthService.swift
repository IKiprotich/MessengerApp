//
//  AuthService.swift
//  MessengerApp
//
//  Created by Ian   on 18/04/2025.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class AuthService{
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
   
    
    
    @MainActor
    func login(withEmail email: String, password:String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch{
            print("DEBUG: Failed to sign in user with error: \(error.localizedDescription)")
        }
    }
    
    
    @MainActor
    func createUser(withEmail email: String, password:String, fullname:String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploadUserData(email: email, fullname: fullname, id: result.user.uid)
        }
        catch{
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut() //signs us out on the backend
            self.userSession = nil // updates routing logic 
        }
        catch{
            print("DEBUG: failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    private func uploadUserData(email: String, fullname: String, id: String) async throws {
           let user = User(fullname: fullname, email: email, profileImageUrl: nil)
            
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
            
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
}
