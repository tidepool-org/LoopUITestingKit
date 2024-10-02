//
//  SystemSettingsScreen.swift
//
//
//  Created by Cameron Ingham on 2/13/24.
//


import XCTest

public final class SystemSettingsScreen: BaseScreen {
    
    private var appName: String
    
    // MARK: Elements
    
    public var loopCell: XCUIElement {
        app.buttons[appName]
    }

    public var notificationsButton: XCUIElement {
        app.descendants(matching: .any).element(matching: .button, identifier: "NOTIFICATIONS")
    }
    
    public var allowNotificationsToggle: XCUIElement {
        app.switches["Allow Notifications"]
    }
    
    public var criticalAlertsToggle: XCUIElement {
        app.switches["Critical Alerts"]
    }
    
    public init(appName: String) {
        self.appName = appName
        super.init(app: XCUIApplication(bundleIdentifier: "com.apple.Preferences"))
    }
    
    // MARK: Actions
    
    public func launchApp() {
        app.launch()
    }
    
    public func openAppSystemSettings() {
        if !app.buttons["Apps"].exists {
            app.swipeUp()
        }
        if app.buttons["Apps"].exists {
            app.buttons["Apps"].tap()
        }
        if !loopCell.exists {
            app.swipeUp()
        }
        loopCell.tap()
    }
    
    public func openSystemNotificationSettings() {
        waitForExistence(notificationsButton)
        notificationsButton.tap()
    }
    
    public func toggleAllowNotifications() {
        waitForExistence(allowNotificationsToggle)
        allowNotificationsToggle.tap()
    }
    
    public func toggleCriticalAlerts() {
        waitForExistence(criticalAlertsToggle)
        criticalAlertsToggle.tap()
    }
}
