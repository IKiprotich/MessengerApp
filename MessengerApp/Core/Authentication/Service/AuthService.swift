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
    func login(withEmail email: String, password:String) async throws {
        print("DEBUG: Email is \(email)")
        print("DEBUG: Password is \(password)")
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
}
