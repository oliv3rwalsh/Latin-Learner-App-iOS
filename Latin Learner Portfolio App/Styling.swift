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
    func headerText() -> some View {
        self.font(.custom("Verdana", size: 20))
    }
}
