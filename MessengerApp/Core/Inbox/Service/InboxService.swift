//
//  InboxService.swift
//  MessengerApp
//
//  Created by Ian   on 27/04/2025.
//

import Firebase
import FirebaseFirestore
import FirebaseAuth

import Firebase
import FirebaseFirestore

class InboxService {
    @Published var documentChanges = [DocumentChange]()
    
    func observeRecentMessages() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
       
        let query = FirestoreConstants
            .MessagesCollection
            .document(uid)
            .collection("recent-messages")
            .order(by: "timeStamp", descending: true)  
        
        query.addSnapshotListener { snapshot, error in
            if let error = error {
                print("DEBUG: Failed to fetch recent messages: \(error.localizedDescription)")
                return
            }
            
            guard let changes = snapshot?.documentChanges.filter({
                $0.type == .added || $0.type == .modified
            }) else { return }
            
            print("DEBUG: Received \(changes.count) recent message changes")
            self.documentChanges = changes
        }
    }
}
