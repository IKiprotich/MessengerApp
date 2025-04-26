//
//  Constants.swift
//  MessengerApp
//
//  Created by Ian   on 26/04/2025.
//

import Firebase

struct FirestoreConstants {
    static let UserCollection = Firestore.firestore().collection("users")
    static let MessagesCollection = Firestore.firestore().collection("messages")
}
