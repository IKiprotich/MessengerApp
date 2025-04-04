//
//  InboxView.swift
//  MessengerApp
//
//  Created by Ian   on 04/04/2025.
//

import SwiftUI

struct InboxView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
            ActiveNowView()
            
            List
            }
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
                        print("Show new message view")
                    }  label: {
                    }
                        Image(systemName: "square.and.pencil.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundStyle(.black, Color(.systemGray5))
                    }
                }
                
            }
        }
        
    }

#Preview {
    InboxView()
}
