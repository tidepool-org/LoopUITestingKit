//
//  SystemSettingsScreen.swift
//
//
//  Created by Cameron Ingham on 2/13/24.
//


import XCTest

public final class SystemSettingsScreen: BaseScreen {
    
    // MARK: Elements
    
    public var loopCell: XCUIElement {
        app.cells[appName]
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
    
    // MARK: Actions
    
    public func launchApp() {
        app.launch()
    }
    
    public func openAppSystemSettings() {
        waitForExistence(loopCell)
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
