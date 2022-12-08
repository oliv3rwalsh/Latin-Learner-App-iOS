//
//  ContentView.swift
//  Latin Learner Portfolio App
//
//  Created by Oliver Walsh on 12/2/22.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

let salutations = ["Hey there", "Welcome", "What's up", "Hello"]
let chosenSalutation = salutations.randomElement()!

struct ContentView: View {
    @EnvironmentObject var vm: UserAuthModel
    
    var body: some View {
        if(vm.isLoggedIn){
            VStack{
                topbar()
                Spacer().frame(height: 25)
                homePageContent()
            }.ignoresSafeArea()
        } else {
            loginScreen()
        }
    }
}

struct homePageContent: View {
    @EnvironmentObject var vm: UserAuthModel
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                Text("ADD CONTENT HERE").mediumText()
                Spacer()
            }
            HStack{
                Spacer()
                Text("HOME PAGE").smallText()
                Spacer()
            }
            Spacer()
        }.background(Color("Google Blue"))
    }
}
