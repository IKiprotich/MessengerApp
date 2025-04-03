//
//  RegistrationView.swift
//  MessengerApp
//
//  Created by Ian   on 03/04/2025.
//

import SwiftUI

struct RegistrationView: View {
    @State var email: String = ""
    @State var fullname: String = ""
    @State var password: String = ""
    var body: some View {
        VStack{
            Spacer()
            //Logo Image
            Image("Messenger")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            
            //Text fields
            
            VStack
            {
                TextField("Enter your email", text:$email)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                
                SecureField("Enter your fullname", text:$fullname)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                
                SecureField("Enter your password", text:$password)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
            }
        }
        }
    }
    
    #Preview {
        RegistrationView()
    }
