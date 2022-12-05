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
                    Button(action: {vm.signOut()}){
                        Text("Sign Out").mediumText()
                            .padding(5)
                    }.signOutButton()
                    Spacer()
                }
                Spacer()
            }
        } else {
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
}
