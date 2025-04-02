//
//  LoginView.swift
//  MessengerApp
//
//  Created by Ian   on 02/04/2025.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack{
            VStack{
                //Logo Image
                Image("Messenger")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding()
                
                //Text fields
                VStack
                {
                    TextField("Enter your email", text:$email)
                        .padding()
                    SecureField("Enter your password", text:$password)
                        .padding()
                }
                
                //Forgot password
                Button {
                    print("Forgot Password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                
                //Log in button
                
                //Faceboook log in
                
                //Sign up link
            }
        }
    }
}

#Preview {
    LoginView()
}
