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

    @Published var pushNextViewNavigationData: SourceViewNavigationData? // NOTE: - PUSH NAVIGATION STEP 1
    @Published var pushNavigation: Bool = false // Cannot avoid this // NOTE: - PUSH NAVIGATION STEP 2
    @Published var sheetNextViewNavigationData: SourceViewNavigationData?
    @Published var coverNextViewNavigationData: SourceViewNavigationData?

    // MARK: - Private (ViewModel Only)

    private var nextLevel: Int {
        level + 1
    }

    // MARK: - Init
    
    init(with navigationData: SourceViewNavigationData) {
        self.level = navigationData.level

        // NOTE: - PUSH NAVIGATION STEP 4
        setupObservers()
    }

    private func setupObservers() {
        // NOTE: - PUSH NAVIGATION STEP 3
        $pushNextViewNavigationData
            .map { $0 != nil }
            .assign(to: &$pushNavigation)
    }

    // MARK: - Handling User Interactions

    public func buttonPressWhichTriggersPushNavigation() {
        // NOTE: - PUSH NAVIGATION STEP 5
        pushNextViewNavigationData = .init(level: nextLevel)
    }

    public func buttonPressWhichTriggersSheetNavigation() {
        sheetNextViewNavigationData = .init(level: nextLevel)
    }

    public func buttonPressWhichTriggersFullScreenCoverNavigation() {
        coverNextViewNavigationData = .init(level: nextLevel)
    }
}
