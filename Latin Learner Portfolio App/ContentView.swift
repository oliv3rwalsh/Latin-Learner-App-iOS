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
        ScrollView(showsIndicators: false){
            VStack{
                Spacer()
                VStack{
                    Spacer().frame(height: 60)
                    examplePost()
                    examplePost()
                    examplePost()
                }
                HStack{
                    Spacer()
                    Image(systemName: "moon.zzz.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.gray)
                    Spacer().frame(width: 15)
                    Text("You've reached the end of your feed").mediumText()
                        .foregroundColor(Color.gray)
                    Spacer()
                }
                Spacer().frame(minHeight: 150)
                
            }
        }
    }
}

struct examplePost: View {
    var body: some View {
        Rectangle()
            .fill(Color.gray)
            .frame(width: 360, height: 270)
        HStack{
            Text("Skill").mediumText()
            Spacer()
            Text("Date").mediumText()
        }.frame(width: 360)
        Spacer().frame(height: 60)
    }
}
