//
//  Search.swift
//  Latin Learner Portfolio App
//
//  Created by Oliver Walsh on 12/6/22.
//

import SwiftUI

struct Search: View {
    @EnvironmentObject var vm: UserAuthModel
    var body: some View {
        if(vm.isLoggedIn){
            VStack{
                topbar()
                Spacer().frame(height: 25)
                searchPageContent()
            }.ignoresSafeArea()
        } else {
            loginScreen()
        }
    }
}

struct searchPageContent: View {
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
                Text("SEARCH PAGE").smallText()
                Spacer()
            }
            Spacer()
        }.background(Color("Google Red"))
    }
}
