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
        VStack{
            Spacer().frame(height: 20)
            headerBar()
            Spacer()
        }
    }
}

struct headerBar : View {
    @EnvironmentObject var vm: UserAuthModel
    var body: some View {
        HStack{
            Spacer().frame(width: 30)
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
            Spacer().frame(width: 30)
            if(vm.isLoggedIn){
                Text("Welcome, " + vm.givenName).headerText()
            } else {
                Text("Please Sign In").headerText()
            }
            Spacer()
            // vm.signIn, vm.signOut to sign in and out
        }
    }
}
