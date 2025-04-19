//
//  ContentViewModel.swift
//  MessengerApp
//
//  Created by Ian   on 19/04/2025.
//

import Foundation
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers(){
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
      }
    }

