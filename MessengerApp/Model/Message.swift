//
//  Message.swift
//  MessengerApp
//
//  Created by Ian   on 24/04/2025.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

struct Message: Identifiable, Hashable, Codable {
    @DocumentID var messageId: String?
    let fromId: String
    let toId: String
    let messageText: String
    let timeStamp: Timestamp
    
    var user: User?
    
    var id: String{
        return messageId ?? NSUUID().uuidString
    }
    
    var chatPartnerId: String{
        return fromId == Auth.auth().currentUser?.uid ? toId : fromId
    }
    
    var isFromCurrentUser: Bool{
        return fromId == Auth.auth().currentUser?.uid
    }
    
    var timeStampString: String{
        return timeStamp.dateValue().timestampString()
    }
}
