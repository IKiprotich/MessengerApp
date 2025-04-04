//
//  InboxRowView.swift
//  MessengerApp
//
//  Created by Ian   on 04/04/2025.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12){
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width:64 , height: 64)
                .foregroundColor(Color(.systemGray4))
            
            VStack(alignment: .leading, spacing: 6){
                Text("Ian Kiprotich")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                
                Text("Hello, how are you?")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            
            HStack{
                Text("Yesterday")
                
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
            .fontWeight(.medium)
            
        }
        .frame(height: 72)
        .padding(.horizontal)
    }
}

#Preview {
    InboxRowView()
}
