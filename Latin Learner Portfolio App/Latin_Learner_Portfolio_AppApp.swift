//
//  Latin_Learner_Portfolio_AppApp.swift
//  Latin Learner Portfolio App
//
//  Created by Oliver Walsh on 12/2/22.
//

import SwiftUI
import GoogleSignIn

@main
struct Latin_Learner_Portfolio_AppApp: App {
    @StateObject var userAuth: UserAuthModel =  UserAuthModel()
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView().tabItem{
                    Image(systemName: "house")
                }
                SearchPortfolio().tabItem{
                    Image(systemName: "magnifyingglass")
                }
                AppSettings().tabItem{
                    Image(systemName: "gearshape")
                }
            }
            .accentColor(Color("Latin Blue"))
            .environmentObject(userAuth)
            .navigationViewStyle(.stack)
            
        }
    }
}

