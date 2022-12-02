//
//  AppSettings.swift
//  Latin Learner Portfolio App
//
//  Created by Oliver Walsh on 12/2/22.
//

import SwiftUI

struct AppSettings: View {
    @EnvironmentObject var vm: UserAuthModel
    var body: some View {
        VStack {
            Spacer()
            if(vm.isLoggedIn){
                Button(action: {vm.signOut()} ) {
                    Text("Sign Out")
                }
            } else {
                Button(action: {vm.signIn()} ) {
                    Text("Sign In")
                }
            }
            Spacer()
        }
    }
}

struct AppSettings_Previews: PreviewProvider {
    static var previews: some View {
        AppSettings()
    }
}
