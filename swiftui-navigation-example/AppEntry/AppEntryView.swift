//
//  AppEntryView.swift
//  swiftui-navigation-example
//
//  Created by Eszenyi Gábor on 2021. 10. 28..
//

import SwiftUI

// Pop to root

struct AppEntryView: View {
    @StateObject private var state: AppEntry = .state

    var body: some View {
        view
    }

    @ViewBuilder
    var view: some View {
        // Dangerous operation. Not recommended to use when you're in a navigation stack. Only use for splash screen and app start.
        switch state.screen {
        case .splash: splashScreen
        case .screen1: screen1
        }
    }
}

// MARK: - Destination Views

extension AppEntryView {
    var splashScreen: some View {
        SplashScreen()
            .wrapToNavigationView()
            .transition(.opacity.animation(.easeIn))
    }

    var screen1: some View {
        SourceScreen(with: .init(level: 0))
            .wrapToNavigationView()
            .transition(.opacity.animation(.easeIn))
    }
}

struct AppEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AppEntryView()
    }
}
