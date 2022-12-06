//
//  Post.swift
//  Latin Learner Portfolio App
//
//  Created by Oliver Walsh on 12/6/22.
//

import SwiftUI

struct Post: View {
    @EnvironmentObject var vm: UserAuthModel
    var body: some View {
        if(vm.isLoggedIn){
            VStack{
                topbar()
                Spacer().frame(height: 25)
                postPageContent()
            }.ignoresSafeArea()
        } else {
            loginScreen()
        }
    }
}

struct Post_Previews: PreviewProvider {
    static var previews: some View {
        Post()
    }
}

struct postPageContent: View {
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
                Text("POST PAGE").smallText()
                Spacer()
            }
            Spacer()
        }.background(Color("Google Green"))
    }
}

