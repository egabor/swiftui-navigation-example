//
//  SourceView.swift
//  swiftui-navigation-example
//
//  Created by Eszenyi Gábor on 2021. 10. 23..
//

import SwiftUI

struct SourceView: View {
    @Environment(\.dismiss) private var dismiss

    @State var push: Bool = false
    @State var sheet: Bool = false
    @State var fullScreenCover: Bool = false

    var level: Int

    var body: some View {
        ZStack {
            navigationLinks
            content
        }
    }

    // MARK: - View Content

    var content: some View {
        VStack(spacing: 24) {
            levelText

			dismissButton
            pushButton
            sheetButton
            fullScreenCoverButton
        }
        .hiddenNavigationBar()
        .sheet(
            isPresented: $sheet,
            onDismiss: nil,
            content: { NavigationView { SourceView(level: level + 1) }}
        )
        .fullScreenCover(
            isPresented: $fullScreenCover,
            onDismiss: nil,
            content: { NavigationView { SourceView(level: level + 1) }}
        )
    }

    var levelText: some View {
        Text("Current Level is \(level)")
    }

    // MARK: - Buttons

    @ViewBuilder
    var dismissButton: some View {
        if level != 0 {
            Button("Dismiss") {
                dismiss()
            }
        }
    }

    var pushButton: some View {
        Button("Push") {
            push = true
        }
    }

    var sheetButton: some View {
        Button("Sheet") {
            sheet = true
        }
    }

    var fullScreenCoverButton: some View {
        Button("Full Screen Cover") {
            fullScreenCover = true
        }
    }

    // MARK: - Navigation Links

    private var navigationLinks: some View {
        Group {
            NavigationLink(
                destination: SourceView(level: level + 1),
                isActive: $push,
                label: {}
            )
        }
    }
}

struct SourceView_Previews: PreviewProvider {
    static var previews: some View {
        SourceView(level: 0)
    }
}
