//
//  AuthService.swift
//  MessengerApp
//
//  Created by Ian   on 18/04/2025.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthService{
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
    
    
    
    
    func login(withEmail email: String, password:String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch{
            print("DEBUG: Failed to sign in user with error: \(error.localizedDescription)")
        }
    }
    
    
    
    func createUser(withEmail email: String, password:String, fullname:String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: User created \(result.user.uid)")
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
    
}
