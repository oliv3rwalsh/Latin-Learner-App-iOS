//
//  FileStorage.swift
//  Latin Learner Portfolio App
//
//  Created by Domenic Sacchetti on 12/6/22.
//

import SwiftUI
import Firebase
import FirebaseStorage

class FirebaseManager: NSObject {
    
    let storage: Storage
    
    static let shared = FirebaseManager()
    
    override init() {
        FirebaseApp.configure()
        
        self.storage = Storage.storage()
        
        super.init()
    }
    
}

struct ImageUpload: View {
    
    @State var shouldShowImagePicker = false
    
    
    
    var body: some View {
        VStack {
            Button {
                shouldShowImagePicker.toggle()
            } label: {
                VStack {
                    if let image = self.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 128, height: 128)
                        Text("Click to Change")
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                    }
                }
            }
            Button("Upload Image") {
                persistImageToStorage()
            }.padding()
        }
        .padding()
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            ImagePicker(image: $image)
        }
    }
    
    @State var image: UIImage?
    
    private func persistImageToStorage() {
        let ref = FirebaseManager.shared.storage.reference(withPath: "TestImage")
        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
        ref.putData(imageData, metadata: nil) { metadata, err in
            if let err = err {
                print("Failed to push image to storage: \(err)")
                return
            }
            ref.downloadURL { url, err in
                if let err = err {
                    print("Failed to retrieve downloadURL: \(err)")
                    return
                }
                print("Successfully stored image with url: \(url?.absoluteString ?? "")")
            }
        }
    }
}
