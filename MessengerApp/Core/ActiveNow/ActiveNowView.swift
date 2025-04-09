//
//  ActiveNowView.swift
//  MessengerApp
//
//  Created by Ian   on 04/04/2025.
//

import SwiftUI

struct ActiveNowView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 32){
                ForEach(0 ... 10, id: \.self){
                    user in
                    VStack{
                        ZStack(alignment: .bottomTrailing){
                            CircularProfileImageView(user: User.MOCK_USER, size: .medium)
                            
                            ZStack{
                                Circle()
                                    .fill(Color(.systemGreen))
                                    .frame(width: 112, height: 12)
                                
                            }
                        }
                        Text("Ian")
                            .font(.subheadline)
                            .foregroundColor(Color(.systemGray))
                        
                    }
                    
                }
            }
            .padding()
        }
        .frame(height: 106)
    }
}

#Preview {
    ActiveNowView()
}
