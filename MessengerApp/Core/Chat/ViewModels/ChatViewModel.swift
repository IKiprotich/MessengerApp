//
//  ChatViewModel.swift
//  MessengerApp
//
//  Created by Ian   on 24/04/2025.
//

import Foundation

class ChatViewModel: ObservableObject{
    @Published var messageText = ""
    let user: User
    
    
    init(user: User){
        self.user = user
    }
    
    
    func sendMesage(){
        MessageService.sendMessage(messageText, toUser: user)
    }
    
    
}
