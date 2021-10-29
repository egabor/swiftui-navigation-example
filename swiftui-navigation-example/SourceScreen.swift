//
//  SourceScreen.swift
//  swiftui-navigation-example
//
//  Created by Eszenyi Gábor on 2021. 10. 23..
//

import SwiftUI

struct SourceScreen: View {
    @StateObject var viewModel: SourceViewModel

    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.modalRootPresentation) private var dismissModal

    // The View's init defines how can we get into this view.
    init(with navigationData: SourceViewNavigationData) {
        _viewModel = .init(
            wrappedValue: .init(
                with: navigationData
            )
        )
    }

    var body: some View {
        ZStack {
            navigationLinks
            content
        }
    }

    // MARK: - View Content

    var content: some View {
        VStack(spacing: 32) {
            levelText

			dismissButton
            pushButton
            sheetButton
            fullScreenCoverButton
//            splashScreenButton
            dismissCurrentModalButton
        }
        .hiddenNavigationBar()
        .sheet(
            item: $viewModel.sheetNextViewNavigationData,
            onDismiss: nil,
            content: sheetDestinationView
        )
        // Use the fullScreenCover when want to show a flow which will be dismissed at the final step.
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

//    var splashScreenButton: some View {
//        Button("Go To Splash") {
//            // This only should be used when there aren't any sheets or fullScreenCovers shown.
//            withAnimation {
//                AppEntry.state.screen = .splash
//            }
//        }
//    }

    var dismissCurrentModalButton: some View {
        Button("Dismiss Modal Anywhere From It's Stack") {
            dismissModal()
        }
    }

    // MARK: - Navigation Links

    var navigationLinks: some View {
        Group {
            pushNavigationLink
        }
    }

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
extension SourceScreen {
    @ViewBuilder
    var pushDestinationView: some View {
        if let navigationData = viewModel.pushNextViewNavigationData {
            SourceScreen(with: navigationData) // Do not wrap the view into NavigationView when using push.
        }
    }

    @ViewBuilder
    func sheetDestinationView(_ navigationData: SourceViewNavigationData) -> some View {
        SourceScreen(with: navigationData)
            .wrapToNavigationView(level: navigationData.level)
    }

    func coverDestinationView(_ navigationData: SourceViewNavigationData) -> some View {
        SourceScreen(with: navigationData)
            .wrapToNavigationView(level: navigationData.level)
    }
}

struct SourceView_Previews: PreviewProvider {
    static var previews: some View {
        SourceScreen(with: .init(level: 0))
    }
}
