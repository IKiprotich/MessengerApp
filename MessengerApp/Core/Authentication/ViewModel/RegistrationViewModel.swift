//
//  RegistrationViewModel.swift
//  MessengerApp
//
//  Created by Ian   on 18/04/2025.
//

import SwiftUI
class RegistrationViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    func createUser()async throws{
        try await AuthService().createUser(withEmail: email, password: password, fullname: fullname)
    }
    
}
