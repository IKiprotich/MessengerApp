//
//  MessageService.swift
//  MessengerApp
//
//  Created by Ian on 24/04/2025.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct MessageService {
    
    static let messagesCollection = Firestore.firestore().collection("messages")
    
    static func sendMessage(_ messageText: String, toUser user: User) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let chatPartnerId = user.id
        
        let currentUserChatRef = messagesCollection
            .document(currentUid)
            .collection(chatPartnerId)
        
        let chatPartnerChatRef = messagesCollection
            .document(chatPartnerId)
            .collection(currentUid)
        
        let messageId = currentUserChatRef.document().documentID
        
        let message = Message(
            messageId: messageId,
            fromId: currentUid,
            toId: chatPartnerId,
            messageText: messageText,
            timeStamp: Timestamp()
        )
        
        guard let messageData = try? Firestore.Encoder().encode(message) else { return }
        
        currentUserChatRef.document(messageId).setData(messageData)
        chatPartnerChatRef.document(messageId).setData(messageData)
    }
}
