//
//  Styling.swift
//  Latin Learner Portfolio App
//
//  Created by Oliver Walsh on 12/2/22.
//

import Foundation
import SwiftUI

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
        self.padding(5)
            .border(Color.black, width: 2)
            .foregroundColor(Color.black)
    }
    func signOutButton() -> some View {
        self.background(Color(.black))
            .foregroundColor(Color(.white))
    }
    func publishButton() -> some View {
        self.background(Color.white.shadow(color: Color.gray, radius: 10, x: 0, y: 0))
    }
}

extension VStack {
    func bar() -> some View {
        self.background(Color.white.shadow(color: Color.gray, radius: 10, x: 0, y: 0))
    }
    func uploadContainer() -> some View {
        self.background(Color.white.shadow(color: Color.gray, radius: 10, x: 0, y: 0))
            
    }
}

extension Image {
    func displayImage () -> some View {
        self.resizable()
        .scaledToFill()
        .frame(width: 128, height: 128)
    }
    func uploadImageButton() -> some View {
        self.resizable()
        .scaledToFill()
        .frame(width: 50, height: 50)
    }
    func uploadIcon() -> some View {
        self.resizable()
        .scaledToFill()
        .frame(width: 75, height: 75)
    }
}
