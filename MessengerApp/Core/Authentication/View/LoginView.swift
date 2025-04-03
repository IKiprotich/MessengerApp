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
                    SecureField("Enter your password", text:$password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
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
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width:360, height: 44 )
                        .background(Color(.blue))
                        .cornerRadius(10)
                        
                }
                .padding(.vertical)
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
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                    
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
