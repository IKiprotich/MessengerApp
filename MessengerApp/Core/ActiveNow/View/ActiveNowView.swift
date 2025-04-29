//
//  ActiveNowView.swift
//  MessengerApp
//
//  Created by Ian   on 04/04/2025.
//

import SwiftUI

struct ActiveNowView: View {
    @StateObject var viewModel = ActiveNowViewModel()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 32){
                ForEach(viewModel.users){
                    user in
                    NavigationLink(value: Route.chatView(user)){
                        VStack{
                            ZStack(alignment: .bottomTrailing){
                                CircularProfileImageView(user: user, size: .medium)
                                
                                ZStack{
                                    Circle()
                                        .fill(Color(.systemGreen))
                                        .frame(width: 112, height: 12)
                                    
                                }
                            }
                            Text(user.firstname)
                                .font(.footnote)
                                .foregroundColor(Color(.systemGray))
                            
                        }
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
