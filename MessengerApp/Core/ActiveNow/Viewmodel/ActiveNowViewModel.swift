//
//  ActiveNowViewModel.swift
//  MessengerApp
//
//  Created by Ian   on 29/04/2025.
//


import Foundation

class ActiveNowViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task{
            try await fetchUsers()}
    }
    
    @MainActor
    private func fetchUsers() async throws{
        self.users = try await UserService.fetchAllUsers()
    }
}
