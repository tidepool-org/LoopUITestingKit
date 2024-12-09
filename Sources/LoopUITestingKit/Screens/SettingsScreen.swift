//
//  SettingsScreen.swift
//  TidepoolSupport
//
//  Created by Petr Žywczok on 19.11.2024.
//

import XCTest

public final class SettingsScreen: BaseScreen {
    
    // MARK: Elements
    
    private var insulinPump: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "settingsViewInsulinPump").firstMatch
    }
    private var pumpSimulatorButton: XCUIElement { app.buttons["Pump Simulator"] }
    private var pumpSimulatorDoneButton: XCUIElement { app.navigationBars["Pump Simulator"].buttons["Done"] }
    private var cgm: XCUIElement { app.descendants(matching: .any).matching(identifier: "settingsViewCGM").firstMatch }
    private var cgmSimulatorButton: XCUIElement { app.buttons["CGM Simulator"] }
    private var settingsDoneButton: XCUIElement { app.navigationBars["Settings"].buttons["Done"] }
    private var alertManagementAlertWarning: XCUIElement { app.images["settingsViewAlertManagementAlertWarning"] }
    private var alertManagementButton: XCUIElement { app.buttons["settingsViewAlertManagement"].firstMatch }
    private var alertPermissionsWarningImage: XCUIElement {
        app.images["settingsViewAlertManagementAlertPermissionsAlertWarning"]
    }
    private var manageIosPermissionsButton: XCUIElement { app.buttons["Manage iOS Permissions"] }
    private var alertPermissionsNotificationsEnabled: XCUIElement {
        app.staticTexts["settingsViewAlertManagementAlertPermissionsNotificationsEnabled"]
    }
    private var alertPermissionsNotificationsDisabled: XCUIElement {
        app.staticTexts["settingsViewAlertManagementAlertPermissionsNotificationsDisabled"]
    }
    private var alertPermissionsCriticalAlertsEnabled: XCUIElement {
        app.staticTexts["settingsViewAlertManagementAlertPermissionsCriticalAlertsEnabled"]
    }
    private var alertPermissionsCriticalAlertsDisabled: XCUIElement {
        app.staticTexts["settingsViewAlertManagementAlertPermissionsCriticalAlertsDisabled"]
    }
    private var closedLoopToggle: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "settingsViewClosedLoopToggle").switches.firstMatch
    }
    private var confirmCloseLoopToggle: XCUIElement { app.buttons["Yes, turn OFF"].firstMatch }
    private var iOsPermissionsButton: XCUIElement {
        app.buttons.containing(NSPredicate(format: "label == 'iOS Permissions'")).firstMatch
    }
    
    // MARK: Actions
    
    public func tapInsulinPump() {
        insulinPump.safeTap()
    }
    
    public func tapPumpSimulatorDoneButton() {
        pumpSimulatorDoneButton.safeTap()
    }
    
    public func tapCGMManager() {
        cgm.safeTap()
    }
    
    public func tapSettingsDoneButton() {
        settingsDoneButton.safeTap()
    }
    
    public func tapAlertManagementButton() {
        alertManagementButton.safeTap()
    }
    
    public func tapiOsPermissionsButton() {
        iOsPermissionsButton.safeTap()
    }
    
    public func tapManageIosPermissionsButton() {
        manageIosPermissionsButton.safeTap()
    }
    
    public func toggleClosedLoop() {
        closedLoopToggle.safeTap()
        _ = confirmCloseLoopToggle.tapIfExists(timeout: 3)
    }
    
    // MARK: Verifications
    
    public var isClosedLoopToggleOn: Bool {
        closedLoopToggle.getValueSafe() == "1"
    }
    
    public var alertWarningExists: Bool {
        alertManagementAlertWarning.safeExists
    }
    
    public var alertPermissionsWarningImageExists: Bool {
        alertPermissionsWarningImage.safeExists
    }
    
    public var alertPermissionsNotificationsDisabledExists: Bool {
        alertPermissionsNotificationsDisabled.safeExists
    }
    
    public var alertPermissionsNotificationsEnabledExists: Bool {
        alertPermissionsNotificationsEnabled.safeExists
    }
    
    public var alertPermissionsCriticalAlertsDisabledExists: Bool {
        alertPermissionsCriticalAlertsDisabled.safeExists
    }
    
    public var alertPermissionsCriticalAlertsEnabledExists: Bool {
        alertPermissionsCriticalAlertsEnabled.safeExists
    }
}
