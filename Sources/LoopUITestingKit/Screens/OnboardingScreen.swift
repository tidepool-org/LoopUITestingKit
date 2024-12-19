//
//  OnboardingScreen.swift
//  TidepoolLoopUITests
//
//  Created by Cameron Ingham on 2/13/24.
//

import XCTest

public final class OnboardingScreen: BaseScreen {
    
    // MARK: Elements
    
    private var welcomeTitleText: XCUIElement { app.staticTexts["Welcome to Tidepool Loop"] }
    private var skipOnboardingAlert: XCUIElement {
        app.alerts["Are you sure you want to skip the rest of onboarding (and use simulators)?"]
    }
    private var allowNotificationsAlert: XCUIElement {
        springBoard.alerts.containing(NSPredicate(format: "label CONTAINS 'Would Like to Send You Notifications'"))
            .firstMatch
    }
    private var allowCriticalAlertsAlert: XCUIElement {
        springBoard.alerts.containing(NSPredicate(format: "label CONTAINS 'Would Like to Send You Critical Alerts'"))
            .firstMatch
    }
    private var skipSectionAlert: XCUIElement { app.alerts["Are you sure you want to skip through this section?"] }
    private var simulatorConfirmationButton: XCUIElement { app.buttons["Yes"] }
    private var alertAllowButton: XCUIElement { springBoard.buttons["Allow"] }
    private var turnOnAllHealthCategoriesText: XCUIElement { app.tables.staticTexts["Turn On All"] }
    private var healthDoneButton: XCUIElement { app.navigationBars["Health Access"].buttons["Allow"] }
    
    // MARK: Actions
    
    public func welcomeTitleTextExists() -> Bool {
        welcomeTitleText.waitForExistence(timeout: basicWait)
    }
    
    public func tapConfirmSkipOnboarding() {
        simulatorConfirmationButton.safeTap()
    }
    
    public func tapForDurationWelcomTitle() {
        if welcomeTitleText.safeExists {
            welcomeTitleText.press(forDuration: 2.5)
        }
    }
    
    public func allowNotifications() {
        if allowNotificationsAlert.waitForExistence(timeout: longWait) {
            alertAllowButton.safeTap()
        }
    }
    
    public func allowCriticalAlerts() {
        if allowCriticalAlertsAlert.waitForExistence(timeout: longWait) {
            alertAllowButton.safeTap()
        }
    }
    
    public func allowHealthKitAuthorization() {
        if turnOnAllHealthCategoriesText.waitForExistence(timeout: longWait) {
            turnOnAllHealthCategoriesText.tap()
            healthDoneButton.safeTap()
        }
    }
    
    // MARK: Verifications
    
    public var skipOnboardingAlertExists: Bool {
        skipOnboardingAlert.safeExists
    }
}
