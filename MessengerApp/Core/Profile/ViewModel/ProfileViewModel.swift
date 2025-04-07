//
//  ProfileViewModel.swift
//  MessengerApp
//
//  Created by Ian   on 07/04/2025.
//

import Foundation
import SwiftUI
import PhotosUI

class ProfileViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem?{
        didSet{
            Task{try await LoadImage()}
        }
    }
    
    @Published var profileImage: Image?
    
    func LoadImage() async throws {
        guard let item = selectedItem else { return }
        guard let imageData = try await item.loadTransferable(type: Data.self) else{return}
        guard let uiImage = UIImage(data: imageData) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}
