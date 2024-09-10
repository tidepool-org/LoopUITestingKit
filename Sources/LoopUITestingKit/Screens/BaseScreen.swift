//
//  BaseScreen.swift
//
//
//  Created by Cameron Ingham on 2/13/24.
//

import XCTest

open class BaseScreen {
    public let app: XCUIApplication
    public let springboardApp: XCUIApplication = XCUIApplication(bundleIdentifier:"com.apple.springboard")
    public let bundleIdentifier: String? = Bundle.main.bundleIdentifier


    public init(app: XCUIApplication) {
        self.app = app
    }
}




