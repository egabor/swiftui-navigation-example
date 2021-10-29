//
//  View+NavigationView.swift
//  swiftui-navigation-example
//
//  Created by Eszenyi Gábor on 2021. 10. 27..
//

import SwiftUI

public extension View {
    /// The `level` param is for debugging and logging purposes only. No business logic is built for this.
    func wrapToNavigationView(level: Int? = nil) -> some View {
        RootNavigationView(level: level) { self }
    }
}
