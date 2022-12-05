//
//  ContentView.swift
//  Latin Learner Portfolio App
//
//  Created by Oliver Walsh on 12/2/22.
//

import SwiftUI
import GoogleSignIn

struct ContentView: View {
    @EnvironmentObject var vm: UserAuthModel
    
    var body: some View {
        if(vm.isLoggedIn){
            mainScreen()
        } else {
            loginScreen()
        }
    }
}

struct loginScreen: View {
    @EnvironmentObject var vm: UserAuthModel
    var body: some View {
        VStack{
            Spacer()
            Text("You must be signed in to access your Latin Learner Portfolio").largeText()
                .multilineTextAlignment(.center)
            Button(action: {vm.signIn()}){
                Text("Sign in with Google").mediumText()
                    .padding(10)
            }.signInButton()
            Spacer()
        }
    }
}

struct mainScreen: View {
    @EnvironmentObject var vm: UserAuthModel
    @State private var showingAlert = false
    var body: some View {
        VStack{
            HStack{
                Spacer()
                AsyncImage(
                    url: URL(string: vm.profilePicUrl),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 45, maxHeight: 45)
                            .cornerRadius(90.0)
                    },
                    placeholder: {
                        Image(systemName: "person.circle.fill").font(.system(size: 45))
                    }
                )
                Spacer()
                Text("Signed in as " + vm.givenName).mediumText()
                Spacer()
                
                
                
                Button(action: {showingAlert = true}){
                    Image(systemName: "person.fill.xmark").font(.system(size: 25))
                }
                .foregroundColor(Color(.black))
                .alert(isPresented:$showingAlert) {
                    Alert(
                        title: Text("Do you want to sign out?"),
                        message: Text("You will not be able to access your Latin Learner Portfolio if you are not signed into your Google account"),
                        primaryButton: .default(Text("Sign Out")) {
                            vm.signOut()
                        },
                        secondaryButton: .cancel()
                    )
                }
                
                
                
                Spacer()
            }
            Spacer()
        }
    }
}
