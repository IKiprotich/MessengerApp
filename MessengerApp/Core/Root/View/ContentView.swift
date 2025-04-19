//
//  ContentView.swift
//  MessengerApp
//
//  Created by Ian   on 02/04/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        Group{
            if viewModel.userSession != nil{
                InboxView()
            } else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
