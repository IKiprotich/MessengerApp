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
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                //Log in button
                
                Button {
                    print("Forgot Password")
                } label: {
                    Text("Login")
                }
                
                //Faceboook log in
                
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2) - 40, height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2) - 40, height: 0.5)
                }
                .foregroundColor(.gray)
                
                HStack{
                    Image("facebook")
                        .resizable()
                        .frame(width:20, height: 20)
                    
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.blue))
                    
                }
                .padding(.top, 8)
                
                Spacer()
                
                //Sign up link
                Divider()
                
                NavigationLink {
                    Text("sign up view")
                    
                } label: {
                    HStack (spacing: 3){
                        Text("Don't have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    LoginView()
}
