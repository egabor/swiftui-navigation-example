//
//  AppEntry.swift
//  swiftui-navigation-example
//
//  Created by Eszenyi Gábor on 2021. 10. 28..
//

import Foundation
import Combine
import UIKit.UIApplication

class AppEntry: ObservableObject {

    public enum Screen {
        case splash, screen1
    }

    @Published var screen: Screen = .splash

    private init() {}

    public static let state = AppEntry()

}
