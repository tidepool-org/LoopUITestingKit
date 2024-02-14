//
//  BaseScreen.swift
//
//
//  Created by Cameron Ingham on 2/13/24.
//

import XCTest

open class BaseScreen {
    public let app: XCUIApplication
    public let appName: String
    public let springboardApp: XCUIApplication = XCUIApplication(bundleIdentifier:"com.apple.springboard")
    public let bundleIdentifier: String? = Bundle.main.bundleIdentifier

    public init(app: XCUIApplication, appName: String) {
        self.app = app
        self.appName = appName
    }
    
    public func deleteApp() {
        app.terminate()

        let icon = springboardApp.icons[appName]
        if icon.exists {
            let iconFrame = icon.frame
            let springboardFrame = springboardApp.frame
            icon.press(forDuration: 5)

            // Tap the little "X" button at approximately where it is. The X is not exposed directly
            springboardApp.coordinate(withNormalizedOffset: CGVector(dx: (iconFrame.minX + 3) / springboardFrame.maxX, dy: (iconFrame.minY + 3) / springboardFrame.maxY)).tap()

            springboardApp.alerts.buttons["Delete App"].tap()
            
            waitForExistence(springboardApp.alerts.buttons["Delete"])
            springboardApp.alerts.buttons["Delete"].tap()
            
            waitForExistence(springboardApp.alerts.buttons["OK"])
            springboardApp.alerts.buttons["OK"].tap()
        }
    }
}




