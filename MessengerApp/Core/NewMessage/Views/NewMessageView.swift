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
    @StateObject private var viewModel = NewMessageViewModel()
    @Binding var selectedUser: User?
    
    var body: some View {
        
        NavigationStack{ ScrollView {
            TextField("To: ", text: $searchText)
                .frame(height: 44)
                .padding(.leading)
                .background(Color(.systemGroupedBackground))
            
            Text("CONTACTS")
                .foregroundColor(.gray)
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            ForEach(viewModel.users){ user in
                VStack {
                    HStack {
                        CircularProfileImageView(user: user, size: .small)
                        
                        Text(user.fullname)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        
                        Spacer()
                    }
                    .padding(.leading)
                    Divider()
                        .padding(.leading, 40)
                }
                .onTapGesture{
                    selectedUser = user
                    dismiss()
                }
            }
    
            
            
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
        NewMessageView(selectedUser: .constant (User.MOCK_USER))
    }
}
