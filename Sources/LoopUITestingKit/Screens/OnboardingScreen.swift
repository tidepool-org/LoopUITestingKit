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
    private var alertDontAllowButton: XCUIElement { app.navigationBars["Health Access"].buttons["Don’t Allow"] }
    private var continueButton: XCUIElement { app.buttons["button_continue"] }
    private var finishButton: XCUIElement { app.buttons["button_finish"] }
    private var closeButton: XCUIElement { app.buttons["button_close"] }
    private var backButton: XCUIElement { app.buttons["button_back"] }
    private var emptyCircleADayInTheLifeOther: XCUIElement { app.otherElements["emptyCircle_aDayInTheLife"] }
    private var yourSettingsButton: XCUIElement { app.buttons["button_your_settings"] }
    private var yourTidePoolAccountTitle: XCUIElement { app.staticTexts["Your Tidepool Account"] }
    private var continueYourSettingsButton: XCUIElement { app.buttons["button_next"] }
    private var yourSettingsTitleText: XCUIElement { app.staticTexts["yourSettingsOnboardingTitleText"] }
    private var gettingToKnowLoopTitleText: XCUIElement { app.staticTexts["title_GettingToKnow"] }
    private var okAlertButton: XCUIElement { app.alerts.buttons["OK"] }
    
    // MARK: Actions
    
    public func welcomeTitleTextExists() -> Bool { welcomeTitleText.waitForExistence(timeout: basicWait) }
    public func tapConfirmSkipOnboarding() { simulatorConfirmationButton.safeTap() }
    public func tapYourSettingsButton() { yourSettingsButton.safeTap() }
    public func tapContinueYourSettingsButton() { continueYourSettingsButton.safeTap() }
    
    public func tapForDurationGettingToKnowTitle() {
        if gettingToKnowLoopTitleText.safeExists {
            gettingToKnowLoopTitleText.press(forDuration: 2.5)
        }
    }
    
    public func tapForDurationWelcomTitle() {
        if welcomeTitleText.safeExists {
            welcomeTitleText.press(forDuration: 2.5)
        }
    }
    
    public func tapForDurationYourTidepoolAccountTitle() {
        if yourTidePoolAccountTitle.safeExists {
            yourTidePoolAccountTitle.press(forDuration: 2.5)
        }
    }
    
    public func tapForDurationYourSettingsTitle() {
        if yourSettingsTitleText.safeExists {
            yourSettingsTitleText.press(forDuration: 2.5)
        }
    }
    
    public func tapForDurationDayInLife() {
        if emptyCircleADayInTheLifeOther.safeExists {
            let elementPosition = emptyCircleADayInTheLifeOther.frame
            
            app.safePressWithDurationAtPosition(
                tapPosition: CGPoint(x: elementPosition.minX + 1, y: elementPosition.minY + 1)
            )
        }
    }
    
    public func tapContinueButton() { continueButton.safeTap() }
    public func tapFinishButton() { finishButton.safeTap() }
    public func tapCloseButton() { closeButton.safeTap() }
    public func tapBackButton() { backButton.safeTap() }
    
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
    
    public func dontAllowHelthKitAuthorization() {
        alertDontAllowButton.safeTap()
        okAlertButton.safeTap()
    }
    
    // MARK: Verifications
    
    public var skipOnboardingAlertExists: Bool { skipOnboardingAlert.safeExists }
    public var closeButtonExists: Bool { closeButton.safeExists }
    public var backButtonExists: Bool { backButton.safeExists }
    public var continueButtonExists: Bool { continueButton.safeExists }
    public var yourSettingsButtonIsHittable: Bool { yourSettingsButton.safeExists && yourSettingsButton.isHittable }
}
