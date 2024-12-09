//
//  HomeScreen.swift
//  TidepoolSupport
//
//  Created by Petr Žywczok on 19.11.2024.
//

import XCTest

public final class HomeScreen: BaseScreen {
    
    // MARK: Elements
    
    // Navigation bar
    private var settingsTabButton: XCUIElement { app.buttons["statusTableViewControllerSettingsButton"] }
        private var carbsTabButton: XCUIElement { app.buttons["statusTableViewControllerCarbsButton"] }
        private var bolusTabButton: XCUIElement { app.buttons["statusTableViewControllerBolusButton"] }
        private var preMealTabButton: XCUIElement { app.buttons["statusTableViewPreMealButton"] }
    
    private var hudStatusClosedLoop: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "loopCompletionHUDLoopStatusClosed").firstMatch
    }
    private var hudPumpPill: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "pumpHUDView").firstMatch
    }
    private var closedLoopOnAlertTitle: XCUIElement { app.staticTexts["Closed Loop ON"] }
    private var hudStatusOpenLoop: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "loopCompletionHUDLoopStatusOpen").firstMatch
    }
    private var closedLoopOffAlertTitle: XCUIElement { app.staticTexts["Closed Loop OFF"] }
    private var safetyNotificationsAlertTitle: XCUIElement {
        app.alerts["\n\nWarning! Safety notifications are turned OFF"]
    }
    private var safetyNotificationsAlertCloseButton: XCUIElement { app.alerts.firstMatch.buttons["Close"] }
    private var alertDismissButton: XCUIElement { app.buttons["Dismiss"] }
    private var preMealDialogCancelButton: XCUIElement { app.buttons["Cancel"] }
    private var springboardKeyboardDoneButton: XCUIElement { springBoard.keyboards.buttons["done"] }
    
    
    // MARK: Actions

    public func getPumpPillValue() -> String {
        hudPumpPill.getValueSafe()
    }
    
    public func tapBolusEntry() {
        bolusTabButton.safeTap()
    }
    
    public func tapSettingsButton() {
        settingsTabButton.safeTap()
    }
    
    public func tapSafetyNotificationAlertCloseButton() {
        safetyNotificationsAlertCloseButton.safeTap()
    }
    
    public func tapLoopStatusOpen() {
        hudStatusOpenLoop.safeTap()
    }
    
    public func tapLoopStatusClosed() {
        hudStatusClosedLoop.safeTap()
    }
    
    public func tapLoopStatusAlertDismissButton() {
        alertDismissButton.safeTap()
    }
    
    public func tapPreMealButton() {
        preMealTabButton.safeTap()
    }
    
    public func tapPreMealDialogCancelButton() {
        preMealDialogCancelButton.safeTap()
    }
    
    public func tapCarbEntry() {
        carbsTabButton.safeTap()
    }
    
    public func tapPumpPill() {
        hudPumpPill.safeTap()
    }
    
    // MARK: Verifications
    
    public var hudStatusClosedLoopExists: Bool {
        hudStatusClosedLoop.waitForExistence(timeout: 120)
    }
    
    public var hudStatusOpenLoopExists: Bool {
        hudStatusOpenLoop.safeExists
    }
    
    public var preMealButtonEnabled: Bool {
        preMealTabButton.safeIsEnabled()
    }
    
    public var closedLoopOffAlertTitleExists: Bool {
        closedLoopOffAlertTitle.safeExists
    }
    
    public var closedLoopOnAlertTitleExists: Bool {
        closedLoopOnAlertTitle.safeExists
    }
    
    public func pumpPillDisplaysValue(value: String) {
        XCTAssertTrue(hudPumpPill.getValueSafe().contains(NSLocalizedString(value, comment: "")))
    }
}
