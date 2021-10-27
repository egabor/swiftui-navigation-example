//
//  SourceViewModel.swift
//  swiftui-navigation-example
//
//  Created by Eszenyi Gábor on 2021. 10. 27..
//

import Foundation
import Combine

class SourceViewModel: ObservableObject {

    // MARK: - UI Related

    var level: Int

    var shouldShowDismissButton: Bool {
        level != 0
    }

    // MARK: - Navigation Related

    @Published var pushNextViewNavigationData: SourceViewNavigationData?
    @Published var pushNavigation: Bool = false // Cannot avoid this
    @Published var sheetNextViewNavigationData: SourceViewNavigationData? // NOTE: - SHEET NAVIGATION STEP 1
    @Published var coverNextViewNavigationData: SourceViewNavigationData?

    // MARK: - Private (ViewModel Only)

    private var nextLevel: Int {
        level + 1
    }

    // MARK: - Init
    
    init(with navigationData: SourceViewNavigationData) {
        self.level = navigationData.level

        setupObservers()
    }

    private func setupObservers() {
        $pushNextViewNavigationData
            .map { $0 != nil }
            .assign(to: &$pushNavigation)
    }

    // MARK: - Handling User Interactions

    public func buttonPressWhichTriggersPushNavigation() {
        pushNextViewNavigationData = .init(level: nextLevel)
    }

    // NOTE: - SHEET NAVIGATION STEP 2
    public func buttonPressWhichTriggersSheetNavigation() {
        sheetNextViewNavigationData = .init(level: nextLevel)
    }

    public func buttonPressWhichTriggersFullScreenCoverNavigation() {
        coverNextViewNavigationData = .init(level: nextLevel)
    }
}
