//
//  InboxViewModel.swift
//  MessengerApp
//
//  Created by Ian   on 21/04/2025.
//


import Foundation
import Combine
import Firebase


class InboxViewModel:   ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setUpSubcribers()
    }
    
    private func setUpSubcribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
        
    }
}
