//
//  RootNavigationView.swift
//  swiftui-navigation-example
//
//  Created by Eszenyi Gábor on 2021. 10. 29..
//

import SwiftUI

struct RootNavigationView <Content: View>: View {
    @Environment(\.presentationMode) private var presentationMode

    var level: Int?
    var content: Content

    /// The `level` param is for debugging and logging purposes only. No business logic is built for this.
    init(level: Int? = nil, @ViewBuilder content: () -> Content) {
        self.level = level
        self.content = content()
    }

    var body: some View {
        NavigationView { content }
        .environment(\.modalRootPresentation, dismissModal)
    }

    func dismissModal() {
        if let level = level { print("dismiss at level: \(level)") }
        else { print("nothing to dismiss") }
        presentationMode.wrappedValue.dismiss()
    }
}
