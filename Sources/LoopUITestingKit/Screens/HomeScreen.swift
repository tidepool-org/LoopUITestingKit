//
//  HomeScreen.swift
//
//
//  Created by Cameron Ingham on 2/13/24.
//

import XCTest

public class HomeScreen: BaseScreen {
    
    // MARK: Elements
    
    public var hudStatusClosedLoop: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "loopCompletionHUDLoopStatusClosed").firstMatch
    }
    
    public var hudPumpPill: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "pumpHUDView").firstMatch
    }
    
    public var closedLoopOnAlertTitle: XCUIElement {
        app.staticTexts["Closed Loop ON"]
    }
    
    public var hudStatusOpenLoop: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "loopCompletionHUDLoopStatusOpen").firstMatch
    }
    
    public var closedLoopOffAlertTitle: XCUIElement {
        app.staticTexts["Closed Loop OFF"]
    }
    
    public var preMealTabEnabled: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "statusTableViewPreMealButtonEnabled").firstMatch
    }
    
    public var preMealTabDisabled: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "statusTableViewPreMealButtonDisabled").firstMatch
    }
    
    public var settingsTab: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "statusTableViewControllerSettingsButton").firstMatch
    }
    
    public var carbsTab: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "statusTableViewControllerCarbsButton").firstMatch
    }
    
    public var carbEntryTitle: XCUIElement {
        app.navigationBars.staticTexts["Add Carb Entry"]
    }
    
    public var carbEntryCancelButton: XCUIElement {
        app.navigationBars["Add Carb Entry"].buttons["Cancel"]
    }
    
    public var simpleMealCalculatorTitle: XCUIElement {
        app.navigationBars.staticTexts["Simple Meal Calculator"]
    }
    
    public var simpleMealCalculatorCancelButton: XCUIElement {
        app.navigationBars["Simple Meal Calculator"].buttons["Cancel"]
    }
    
    public var bolusTab: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "statusTableViewControllerBolusButton").firstMatch
    }
    
    public var bolusTitle: XCUIElement {
        app.navigationBars.staticTexts["Bolus"]
    }
    
    public var bolusEntryViewBolusEntryRow: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "dismissibleKeyboardTextField").firstMatch
    }
    
    public var bolusCancelButton: XCUIElement {
        app.navigationBars["Bolus"].buttons["Cancel"]
    }
    
    public var simpleBolusCalculatorTitle: XCUIElement {
        app.navigationBars.staticTexts["Simple Bolus Calculator"]
    }
    
    public var simpleBolusCalculatorCancelButton: XCUIElement {
        app.navigationBars["Simple Bolus Calculator"].buttons["Cancel"]
    }
    
    public var safetyNotificationsAlertTitle: XCUIElement {
        app.alerts["\n\nWarning! Safety notifications are turned OFF"]
    }
    
    public var safetyNotificationsAlertCloseButton: XCUIElement {
        app.alerts.firstMatch.buttons["Close"]
    }
    
    public var alertDismissButton: XCUIElement {
        app.buttons["Dismiss"]
    }
    
    public var confirmationDialogCancelButton: XCUIElement {
        app.buttons["Cancel"]
    }
    
    public var keyboardDoneButton: XCUIElement {
        app.toolbars.firstMatch.buttons["Done"].firstMatch
    }
    
    public var deliverBolusButton: XCUIElement {
        app.buttons["Deliver"]
    }
    
    public var notification: XCUIElement {
        springboardApp.descendants(matching: .any).matching(identifier: "NotificationShortLookView").firstMatch
    }
    
    public var bolusIssueNotificationTitle: XCUIElement {
        app.alerts["Bolus Issue"]
    }
    
    public var passcodeEntry: XCUIElement {
        springboardApp.secureTextFields["Passcode field"]
    }
    
    public var springboardKeyboardDoneButton: XCUIElement {
        springboardApp.keyboards.buttons["done"]
    }
    
    // MARK: Actions
    
    public func openSettings() {
        waitForExistence(settingsTab)
        settingsTab.tap()
    }
    
    public func tapSafetyNotificationAlertCloseButton() {
        waitForExistence(safetyNotificationsAlertCloseButton)
        safetyNotificationsAlertCloseButton.tap()
    }
    
    public func tapLoopStatusOpen() {
        waitForExistence(hudStatusOpenLoop)
        hudStatusOpenLoop.tap()
    }
    
    public func tapLoopStatusClosed() {
        waitForExistence(hudStatusClosedLoop)
        hudStatusClosedLoop.tap()
    }
    
    public func closeLoopStatusAlert() {
        waitForExistence(alertDismissButton)
        alertDismissButton.tap()
    }
    
    public func tapPreMealButton() {
        waitForExistence(preMealTabEnabled)
        preMealTabEnabled.tap()
    }
    
    public func dismissPreMealConfirmationDialog() {
        waitForExistence(confirmationDialogCancelButton)
        confirmationDialogCancelButton.tap()
    }
    
    public func tapCarbEntry() {
        waitForExistence(carbsTab)
        carbsTab.tap()
    }
    
    public func closeMealEntry() {
        waitForExistence(carbEntryCancelButton)
        carbEntryCancelButton.tap()
    }
    
    public func closeSimpleCarbEntry() {
        waitForExistence(simpleMealCalculatorCancelButton)
        simpleMealCalculatorCancelButton.tap()
    }
    
    public func tapBolusEntry() {
        waitForExistence(bolusTab)
        bolusTab.tap()
    }
    
    public func closeBolusEntry() {
        waitForExistence(bolusCancelButton)
        bolusCancelButton.tap()
    }
    
    public func closeSimpleBolusEntry() {
        waitForExistence(simpleBolusCalculatorCancelButton)
        simpleBolusCalculatorCancelButton.tap()
    }
    
    public func tapPumpPill() {
        waitForExistence(hudPumpPill)
        hudPumpPill.tap()
    }
    
    public func tapBolusEntryTextField() {
        waitForExistence(bolusEntryViewBolusEntryRow)
        bolusEntryViewBolusEntryRow.tap()
    }
    
    public func closeKeyboard() {
        waitForExistence(keyboardDoneButton)
        keyboardDoneButton.tap()
    }
    
    public func tapDeliverBolusButton() {
        waitForExistence(deliverBolusButton)
        deliverBolusButton.forceTap()
    }
    
    public func verifyOcclusionAlert() {
//        waitForExistence(notification)
//        notification.tap()
//        waitForExistence(bolusIssueNotificationTitle)
//        app.activate()
        #warning("FIXME")
    }
    
    public func enterPasscode() {
        waitForExistence(passcodeEntry)
        passcodeEntry.tap()
        springboardApp.typeText("1\n")
    }
}
