//
//  InboxRowView.swift
//  MessengerApp
//
//  Created by Ian   on 04/04/2025.
//
import SwiftUI

struct InboxRowView: View {
    let message: Message
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            if let user = message.user {
                CircularProfileImageView(user: user, size: .medium)
            } else {
                // Placeholder when user data isn't available
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 56, height: 56)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(message.user?.fullname ?? "Loading...")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(message.messageText)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            
            HStack {
                Text(message.timeStampString)
                
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
            .fontWeight(.medium)
        }
        .frame(height: 72)
    }
}
