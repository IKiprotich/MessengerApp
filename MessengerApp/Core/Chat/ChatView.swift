//
//  ChatView.swift
//  MessengerApp
//
//  Created by Ian   on 15/04/2025.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    var body: some View {
        VStack {
            ScrollView{
                //header
                VStack{
                    CircularProfileImageView(user:User.MOCK_USER, size: .xlarge)
                    
                    VStack(spacing: 4){
                        Text("Kanye West")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Messenger")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    
                    
                }
                //messages
                
                
            
               
            }
            
            //message input view
            Spacer()
            ZStack(alignment: .trailing){
                TextField("Message...", text: $messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button {
                    print("Send Mesaage")
                } label: {
                    Text("Send")
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

#Preview {
    ChatView()
}
