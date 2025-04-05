//
//  NewMessageView.swift
//  MessengerApp
//
//  Created by Ian   on 05/04/2025.
//

import SwiftUI

struct NewMessageView: View {
    @State private var searchText: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        NavigationStack{ ScrollView{
            TextField("To: ", text: $searchText)
                .frame(height: 44)
                .padding(.leading)
                .background(Color(.systemGroupedBackground))
        }
        .navigationTitle("New Message")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            
            ToolbarItem (placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
                .foregroundColor(.black)
            }
        }
        }
    }
}

#Preview {
    NavigationStack{
        NewMessageView()
    }
}
