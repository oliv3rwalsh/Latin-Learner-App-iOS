//struct uploadButton: View {
//    var body: some View {
//
//    }
//}

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

private func persistImageToStorage(image: UIImage?) {
    let imageToUpload = image
    
    let ref = FirebaseManager.shared.storage.reference(withPath: "TestImage")
    guard let imageData = imageToUpload?.jpegData(compressionQuality: 0.5) else { return }
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

struct ImageUpload: View {
    
    @State var image: UIImage?
    @State var shouldShowImagePicker = false
    
    var body: some View {
        HStack(spacing: 60){
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
                            Text("Change Image").mediumText()
                        } else {
                            Image(systemName: "icloud.and.arrow.up")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                            Text("Select Image").largeText()
                        }
                    }
                }
            }
            if self.image != nil {
                Button("Upload Image") {
                    persistImageToStorage(image: image)
                }.signInButton()
                    .padding()
                    
            }
        }
        .padding()
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            ImagePicker(image: $image)
        }
    }
}
