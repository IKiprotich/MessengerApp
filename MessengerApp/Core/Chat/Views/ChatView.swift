//
//  ChatView.swift
//  MessengerApp
//
//  Created by Ian   on 15/04/2025.
//

import SwiftUI

struct ChatView: View {
    @StateObject var viewModel: ChatViewModel
    let user: User
    
    
    init(user: User){
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
    }
    var body: some View {
        VStack {
            ScrollView{
                //header
                VStack{
                    CircularProfileImageView(user: user, size: .xlarge)
                    
                    VStack(spacing: 4){
                        Text(user.fullname)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Messenger")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    
                    
                }
                //messages
                
                ForEach(0...10, id:\.self){ message in
                    
                    ChatMessageCell(isFromCurrentUser: Bool.random())
                    
                }
            
               
            }
            
            //message input view
            Spacer()
            ZStack(alignment: .trailing){
                TextField("Message...", text: $viewModel.messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button {
                    viewModel.sendMesage()
                    viewModel.messageText = ""
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
    ChatView(user: User.MOCK_USER)
}
