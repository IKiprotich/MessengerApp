//
//  ChatMessageCell.swift
//  MessengerApp
//
//  Created by Ian   on 15/04/2025.
//

import SwiftUI

struct ChatMessageCell: View {
    let isFromCurrentUser: Bool
    var body: some View {
        HStack{
            if isFromCurrentUser{
                Spacer()
                Text("This is a text message for now that is a longer message and will wrap")
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .clipShape(ChatBubble(isfromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
            }
            else {
                HStack(alignment: .bottom, spacing: 8){
                    CircularProfileImageView(user: User.MOCK_USER, size: .xxsmall)
                    
                    Text("This is a text message for now that is longer let's see what happens")
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .clipShape(ChatBubble(isfromCurrentUser: isFromCurrentUser))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.75, alignment: .leading)
                Spacer()
                }
            }
            
        }
        .padding(.horizontal, 8)
        
        
    }
}

#Preview {
    ChatMessageCell(isFromCurrentUser: false)
}
