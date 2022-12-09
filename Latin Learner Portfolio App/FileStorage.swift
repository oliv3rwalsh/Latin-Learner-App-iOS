//struct example: View {
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
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class FirebaseManager: NSObject {
    
    let auth: Auth
    let storage: Storage
    let firestore: Firestore
    
    static let shared = FirebaseManager()
    
    override init() {
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
        
        super.init()
    }
    
}

class upload: ObservableObject {
    @Published var awaitfileUpload = false
    @Published var uploadedSuccessfully = false
    @Published var uploadErrMessage = "EXAMPLE ERROR MESSAGE"
    
    func persistImageToStorage(image: UIImage?) {
       let imageToUpload = image

       let ref = FirebaseManager.shared.storage.reference(withPath: "TestImage")
       guard let imageData = imageToUpload?.jpegData(compressionQuality: 0.5) else { return }
       ref.putData(imageData, metadata: nil) { metadata, err in
           if let err = err {
               self.awaitfileUpload = true
               self.uploadedSuccessfully = false
               self.uploadErrMessage = "\(err)"
               return
           }
           ref.downloadURL { url, err in
               if let err = err {
                   self.awaitfileUpload = true
                   self.uploadedSuccessfully = false
                   self.uploadErrMessage = "\(err)"
                   return
               }
               storeUserInformation(file: url!)
               self.awaitfileUpload = true
               self.uploadedSuccessfully = true
           }
       }
   }
}



 func storeUserInformation(file: URL) {
    guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
    guard let email = FirebaseManager.shared.auth.currentUser?.email else { return }
    let userData = ["email": email, "uid": uid, "testURL": file.absoluteString]
    FirebaseManager.shared.firestore.collection("users")
        .document(uid).setData(userData) { err in
            if let err = err {
                print("Failed to store data: \(err)")
                return
            }
            print("Successfully stored data")
        }
}

struct ImageUpload: View {
    @State var image: UIImage?
    @State var shouldShowImagePicker = false
    
    @ObservedObject var u = upload()
    
    var body: some View {
        if(!u.awaitfileUpload){
            VStack(spacing: 60){
                VStack {
                    Button {
                        shouldShowImagePicker.toggle()
                    } label: {
                        VStack {
                            if let image = self.image {
                                Image(uiImage: image).displayImage()
                                Text("Replace Image").mediumText()
                            } else {
                                Image(systemName: "icloud.and.arrow.up").uploadImageButton()
                                Text("Upload Image").largeText()
                            }
                        }
                    }
                }
                if self.image != nil {
                    Button(action: {
                        u.persistImageToStorage(image: image)
                    }) { Text("Publish Image").mediumText().padding(15) }.publishButton().padding()
                }
            }
            .padding()
            .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {ImagePicker(image: $image)}
        } else {
            if(u.uploadedSuccessfully == true){
                VStack(spacing: 30){
                    Image(systemName: "checkmark.icloud")
                        .uploadImageButton()
                        .foregroundColor(Color("Google Green"))
                    Text("Image Published").largeText()
                }
            } else {
                VStack(spacing: 30){
                    Image(systemName: "exclamationmark.icloud")
                        .uploadImageButton()
                        .foregroundColor(Color("Google Red"))
                    Text("Failed to Publish").largeText()
                    Text(u.uploadErrMessage).smallText()
                }
            }
        }
    }
}
