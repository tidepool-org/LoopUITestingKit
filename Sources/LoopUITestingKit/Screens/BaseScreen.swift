//
//  BaseScreen.swift
//
//
//  Created by Cameron Ingham on 2/13/24.
//

import XCTest

extension XCUIElementQuery {
    var lastMatch : XCUIElement {return self.element(boundBy: self.count - 1)}
}

open class BaseScreen {
    let app: XCUIApplication
    let springBoard: XCUIApplication = XCUIApplication(bundleIdentifier:"com.apple.springboard")
    let basicWait: Double = 5
    let longWait: Double = 20

    public init(app: XCUIApplication) {
        self.app = app
    }
}




