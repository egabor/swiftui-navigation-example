//
//  ContentView.swift
//  swiftui-navigation-example
//
//  Created by Eszenyi Gábor on 2021. 10. 23..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            SourceView(level: 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
