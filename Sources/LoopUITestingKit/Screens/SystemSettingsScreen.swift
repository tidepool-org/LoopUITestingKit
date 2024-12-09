//
//  appScreen.swift
//  TidepoolSupport
//
//  Created by Petr Žywczok on 19.11.2024.
//

import XCTest

public final class SystemSettingsScreen: BaseScreen {
        
    // MARK: Elements
    
    private var appNameButton: XCUIElement { app.buttons["Tidepool Loop"] }
    private var notificationsButton: XCUIElement {
        app.descendants(matching: .any).element(matching: .button, identifier: "NOTIFICATIONS")
    }
    private var notificationsToggle: XCUIElement { app.switches["Allow Notifications"] }
    private var criticalAlertsToggle: XCUIElement { app.switches["Critical Alerts"] }
    private var returnToTidepoolButton: XCUIElement { springBoard.buttons["Return to Tidepool Loop"] }
    
    // MARK: Actions
    
    public func openAppSettings(appName: String) {
        while !app.buttons["Apps"].exists {
            app.swipeUp()
        }
        app.buttons["Apps"].tap()
        while !appNameButton.exists {
            app.swipeUp()
        }
        app.buttons[appName].tap()
    }
    
    public func tapNotificationsButton() {
        notificationsButton.safeTap()
    }
    
    public func tapReturnToTidepoolButton() {
        returnToTidepoolButton.safeTap()
    }
    
    public func toggleAllowNotifications(enableNotifications: Bool = true) {
        let shouldBeEnabled = enableNotifications ? "1" : "0"
        
        if notificationsToggle.getValueSafe() != shouldBeEnabled {
            notificationsToggle.tap()
        }
    }
    
    public func toggleCriticalAlerts(enableCriticalAlerts: Bool = true) {
        let shouldBeEnabled = enableCriticalAlerts ? "1" : "0"
        
        if criticalAlertsToggle.getValueSafe() != shouldBeEnabled {
            criticalAlertsToggle.tap()
        }
    }
}
