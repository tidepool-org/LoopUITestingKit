//
//  SettingsScreen.swift
//
//
//  Created by Cameron Ingham on 2/13/24.
//

import XCTest

public final class SettingsScreen: BaseScreen {
    
    // MARK: Elements
    
    public var insulinPump: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "settingsViewInsulinPump").firstMatch
    }
    
    public var pumpSimulatorTitle: XCUIElement {
        app.navigationBars.staticTexts["Pump Simulator"]
    }
    
    public var pumpSimulatorButton: XCUIElement {
        app.buttons["Pump Simulator"]
    }
    
    public var pumpSimulatorDoneButton: XCUIElement {
        app.navigationBars["Pump Simulator"].buttons["Done"]
    }
    
    public var cgm: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "settingsViewCGM").firstMatch
    }
    
    public var cgmSimulatorTitle: XCUIElement {
        app.navigationBars.staticTexts["CGM Simulator"]
    }
    
    public var cgmSimulatorButton: XCUIElement {
        app.buttons["CGM Simulator"]
    }
    
    public var cgmSimulatorDoneButton: XCUIElement {
        app.navigationBars["CGM Simulator"].buttons["Done"]
    }
    
    public var settingsDoneButton: XCUIElement {
        app.navigationBars["Settings"].buttons["Done"]
    }
    
    public var alertManagementAlertWarning: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "settingsViewAlertManagementAlertWarning").firstMatch
    }
    
    public var alertManagement: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "settingsViewAlertManagement").firstMatch
    }
    
    public var alertPermissionsWarning: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "settingsViewAlertManagementAlertPermissionsAlertWarning").firstMatch
    }
    
    public var managePermissionsInSettings: XCUIElement {
        app.descendants(matching: .any).buttons["Manage iOS Permissions"]
    }
    
    public var alertPermissionsNotificationsEnabled: XCUIElement {
        app.staticTexts["settingsViewAlertManagementAlertPermissionsNotificationsEnabled"]
    }
    
    public var alertPermissionsNotificationsDisabled: XCUIElement {
        app.staticTexts["settingsViewAlertManagementAlertPermissionsNotificationsDisabled"]
    }
    
    public var alertPermissionsCriticalAlertsEnabled: XCUIElement {
        app.staticTexts["settingsViewAlertManagementAlertPermissionsCriticalAlertsEnabled"]
    }
    
    public var alertPermissionsCriticalAlertsDisabled: XCUIElement {
        app.staticTexts["settingsViewAlertManagementAlertPermissionsCriticalAlertsDisabled"]
    }
    
    public var closedLoopToggle: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "settingsViewClosedLoopToggle").switches.firstMatch
    }
    
    public var confirmCloseLoopToggle: XCUIElement {
        app.buttons["Yes, turn OFF"].firstMatch
    }
    
    // MARK: Actions
    
    public func openPumpManager() {
        waitForExistence(insulinPump)
        insulinPump.tap()
    }
    
    public func closePumpSimulator() {
        waitForExistence(pumpSimulatorDoneButton)
        pumpSimulatorDoneButton.tap()
    }
    
    public func openCGMManager() {
        waitForExistence(cgm)
        cgm.tap()
    }
    
    public func closeCGMSimulator() {
        waitForExistence(cgmSimulatorDoneButton)
        cgmSimulatorDoneButton.tap()
    }
    
    public func closeSettingsScreen() {
        waitForExistence(settingsDoneButton)
        settingsDoneButton.tap()
    }
    
    public func openAlertManagement() {
        waitForExistence(alertManagement)
        alertManagement.tap()
    }
    
    public func openAlertPermissions() {
        waitForExistence(alertPermissionsWarning)
        alertPermissionsWarning.tap()
    }
    
    public func openPermissionsInSettings() {
        waitForExistence(managePermissionsInSettings)
        managePermissionsInSettings.tap()
    }
    
    public func toggleClosedLoop() {
        waitForExistence(closedLoopToggle)
        closedLoopToggle.tap()
        sleep(2)
        if confirmCloseLoopToggle.exists {
            confirmCloseLoopToggle.tap()
        }
    }
}
