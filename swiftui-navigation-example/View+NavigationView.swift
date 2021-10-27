//
//  View+NavigationView.swift
//  swiftui-navigation-example
//
//  Created by Eszenyi Gábor on 2021. 10. 27..
//

import SwiftUI

public extension View {
    func wrapToNavigationView() -> some View {
        NavigationView { self }
    }
}
