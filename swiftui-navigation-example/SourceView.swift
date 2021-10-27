//
//  SourceView.swift
//  swiftui-navigation-example
//
//  Created by Eszenyi Gábor on 2021. 10. 23..
//

import SwiftUI

struct SourceView: View {
    @StateObject var viewModel: SourceViewModel

    @Environment(\.presentationMode) private var presentationMode

    // The View's init defines how can we get into this view.
    init(with navigationData: SourceViewNavigationData) {
        _viewModel = .init(
            wrappedValue: .init(
                with: navigationData
            )
        )
    }

    var body: some View {
        // NOTE: - PUSH NAVIGATION STEP 10
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
            item: $viewModel.sheetNextViewNavigationData,
            onDismiss: nil,
            content: sheetDestinationView
        )
        .fullScreenCover(
            item: $viewModel.coverNextViewNavigationData,
            onDismiss: nil,
            content: coverDestinationView
        )
    }

    var levelText: some View {
        Text("Current Level is \(viewModel.level)")
    }

    // MARK: - Buttons

    @ViewBuilder
    var dismissButton: some View {
        if viewModel.shouldShowDismissButton {
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }

    var pushButton: some View {
        Button("Push") {
            // NOTE: - PUSH NAVIGATION STEP 6
            viewModel.buttonPressWhichTriggersPushNavigation()
        }
    }

    var sheetButton: some View {
        Button("Sheet") {
            viewModel.buttonPressWhichTriggersSheetNavigation()
        }
    }

    var fullScreenCoverButton: some View {
        Button("Full Screen Cover") {
            viewModel.buttonPressWhichTriggersFullScreenCoverNavigation()
        }
    }

    // MARK: - Navigation Links

    // NOTE: - PUSH NAVIGATION STEP 9
    var navigationLinks: some View {
        Group {
            pushNavigationLink
        }
    }

    // NOTE: - PUSH NAVIGATION STEP 8
    var pushNavigationLink: some View {
        NavigationLink(
            destination: pushDestinationView,
            isActive: $viewModel.pushNavigation,
            label: {}
        )
    }
}

// MARK: - Destination Views
// These destination views define where can we go (navigate) from this view.
extension SourceView {

    // NOTE: - PUSH NAVIGATION STEP 7
    @ViewBuilder
    var pushDestinationView: some View {
        if let navigationData = viewModel.pushNextViewNavigationData {
            SourceView(with: navigationData) // Do not wrap the view into NavigationView when using push.
        }
    }

    func sheetDestinationView(_ navigationData: SourceViewNavigationData) -> some View {
        SourceView(with: navigationData)
            .wrapToNavigationView()
    }

    func coverDestinationView(_ navigationData: SourceViewNavigationData) -> some View {
        SourceView(with: navigationData)
            .wrapToNavigationView()
    }
}

struct SourceView_Previews: PreviewProvider {
    static var previews: some View {
        SourceView(with: .init(level: 0))
    }
}
