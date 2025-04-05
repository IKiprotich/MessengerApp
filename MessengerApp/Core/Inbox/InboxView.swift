//
//  InboxView.swift
//  MessengerApp
//
//  Created by Ian   on 04/04/2025.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessageView = false
    var body: some View {
        NavigationStack{
            ScrollView{
            ActiveNowView()
            
                List {
                    ForEach (0...10, id: \.self){ message in
                        InboxRowView()
                    }
                    
                }
                .listStyle(PlainListStyle())
                .frame(height:UIScreen.main.bounds.height - 120)
            }
            .fullScreenCover(isPresented: $showNewMessageView, content: {Text("New Message")})
            
            .toolbar{
                ToolbarItem( placement: .navigationBarLeading){
                    HStack{
                        Image(systemName:"person.circle.fill")
                        
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        showNewMessageView.toggle()
                    }  label: {
                        
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black, Color(.systemGray5))
                    }
                    
                    }
                
                }
                
            }
        }
        
    }

#Preview {
    InboxView()
}
