//
//  View+HiddenNavigationBar.swift
//  swiftui-navigation-example
//
//  Created by Eszenyi Gábor on 2021. 10. 23..
//

import SwiftUI

public extension View {
    func hiddenNavigationBar() -> some View {
        modifier( HiddenNavigationBar() )
    }
}

public struct HiddenNavigationBar: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .navigationBarTitle("")
    }
}
