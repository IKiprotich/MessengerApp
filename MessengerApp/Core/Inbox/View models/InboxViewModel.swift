//
//  InboxViewModel.swift
//  MessengerApp
//
//  Created by Ian   on 21/04/2025.
//

import Foundation
import Combine
import Firebase

class InboxViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var recentMessages = [Message]()
    private var cancellables = Set<AnyCancellable>()
    private let service = InboxService()
    
    init() {
        setUpSubscribers()
        service.observeRecentMessages()
    }
    
    private func setUpSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
        
        service.$documentChanges.sink { [weak self] changes in
            self?.loadInitialMessages(fromChanges: changes)
        }
        .store(in: &cancellables)
    }
    
    private func loadInitialMessages(fromChanges changes: [DocumentChange]) {
        // Create a temporary array to hold messages with user data
        let messages = changes.compactMap({ try? $0.document.data(as: Message.self) })
        
        // Clear existing messages if this is the initial load
        if !changes.isEmpty && self.recentMessages.isEmpty {
            self.recentMessages.removeAll()
        }
        
        // Process each message
        for message in messages {
            let messageId = message.id ?? ""
      
            UserService.fetchUser(withUid: message.chatPartnerId) { [weak self] user in
                guard let self = self else { return }
                
               
                var messageWithUser = message
                messageWithUser.user = user
                
                if let index = self.recentMessages.firstIndex(where: { $0.id == messageId }) {
                    self.recentMessages[index] = messageWithUser
                } else {
                    self.recentMessages.append(messageWithUser)
                }
                
                self.recentMessages.sort { $0.timeStamp.dateValue() > $1.timeStamp.dateValue() }
            }
        }
    }
}
