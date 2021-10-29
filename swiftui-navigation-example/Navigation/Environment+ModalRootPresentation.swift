//
//  Environment+ModalRootPresentation.swift
//  swiftui-navigation-example
//
//  Created by Eszenyi Gábor on 2021. 10. 29..
//

import SwiftUI

struct ModalRootPresentationKey: EnvironmentKey {
    static let defaultValue: ModalRootPresentation = { print("❗️ RootPresentationModeKey.defaultValue") }
}

extension EnvironmentValues {
    var modalRootPresentation: ModalRootPresentation {
        get { return self[ModalRootPresentationKey.self] }
        set { self[ModalRootPresentationKey.self] = newValue }
    }
}

typealias ModalRootPresentation = () -> Void
