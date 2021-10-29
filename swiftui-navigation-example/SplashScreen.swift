//
//  SplashScreen.swift
//  swiftui-navigation-example
//
//  Created by Eszenyi Gábor on 2021. 10. 28..
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        VStack {
            Button {
                withAnimation {
                    AppEntry.state.screen = .screen1
                }
            } label: {
                Text("Show App Content")
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
