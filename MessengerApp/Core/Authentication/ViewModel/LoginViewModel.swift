//
//  LoginViewModel.swift
//  MessengerApp
//
//  Created by Ian   on 18/04/2025.
//

import SwiftUI

class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""

    func login() async throws{
        try await AuthService().login(withEmail: email, password: password)
    }
    
    
}


