//
//  Styling.swift
//  Latin Learner Portfolio App
//
//  Created by Oliver Walsh on 12/2/22.
//

import Foundation
import SwiftUI

extension Color {
    static let latinBlue = Color("Latin Blue")
    static let latinOrange = Color("Latin Orange")
}

extension Text {
    func xlText() -> some View {
        self.font(.custom("Verdana", size: 32))
    }
    func largeText() -> some View {
        self.font(.custom("Verdana", size: 24))
    }
    func mediumText() -> some View {
        self.font(.custom("Verdana", size: 16))
    }
    func smallText() -> some View {
        self.font(.custom("Verdana", size: 8))
    }
}

extension Button {
    func signInButton() -> some View {
        self.background(Color("Google Blue"))
            .foregroundColor(Color(.black))
            .padding(10)
    }
    func signOutButton() -> some View {
        self.background(Color(.black))
            .foregroundColor(Color(.white))
    }
}
