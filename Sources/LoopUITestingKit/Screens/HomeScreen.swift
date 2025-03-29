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
        private var presetsTabButton: XCUIElement { app.buttons["statusTableViewPresetsButton"] }
    
    private var hudStatusClosedLoop: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "loopCompletionHUDLoopStatusClosed").firstMatch
    }
    private var hudPumpPill: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "pumpHUDView").firstMatch
    }
    private var hudGlucosePill: XCUIElement {
        app.descendants(matching: .any).matching(NSPredicate(format: "identifier CONTAINS 'glucoseHUDView'")).firstMatch
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
    private var springboardKeyboardDoneButton: XCUIElement { springBoard.keyboards.buttons["done"] }
    private var navigateToGlucoseDetailsText: XCUIElement { app.staticTexts["chartTitleText_Glucose"] }
    private var navigateToActiveCarbsDetailsText: XCUIElement { app.staticTexts["chartTitleText_ActiveCarbohydrates"] }

    private var percentCompletedProgressBar: XCUIElement {
        app.progressIndicators.matching(NSPredicate(format: "identifier CONTAINS 'progressBar_State_'"))
            .firstMatch
    }
    private var bolusProgressText: XCUIElement { app.staticTexts["text_BolusingProgress"] }
    private var tapToStopText: XCUIElement { app.staticTexts["text_TapToStop"] }
    
    // MARK: Actions
    
    public var getPercentCompletedProgressbarValue: String { percentCompletedProgressBar.getValueSafe() }
    public var getPercentCompletedProgressbarState: String { percentCompletedProgressBar.identifier.components(separatedBy: "_")[2] }

    
    public var getPercentCompletedProgressbarValue: String { percentCompletedProgressBar.getValueSafe() }
    public var getPercentCompletedProgressbarState: String { percentCompletedProgressBar.identifier.components(separatedBy: "_")[2] }
    public var getBolusProgressText: String { bolusProgressText.getLableSafe() }
    


    public func getPumpPillValue() -> String { hudPumpPill.getValueSafe() }
    public func getHudGlucosePill() -> String { hudGlucosePill.getValueSafe()}

    public func tapBolusEntry() { bolusTabButton.safeTap() }
    public func tapSettingsButton() { settingsTabButton.safeTap() }
    public func tapSafetyNotificationAlertCloseButton() { safetyNotificationsAlertCloseButton.safeTap() }
    public func tapLoopStatusOpen() { hudStatusOpenLoop.safeTap() }
    public func tapLoopStatusClosed() { hudStatusClosedLoop.safeTap() }
    public func tapLoopStatusAlertDismissButton() { alertDismissButton.safeTap() }
    public func tapCarbEntry() { carbsTabButton.safeTap() }
    public func tapPumpPill() { hudPumpPill.safeTap() }
    public func tapHudGlucosePill() { hudGlucosePill.safeTap() }
    public func tapPresetsTabButton() { presetsTabButton.safeTap() }
    public func tapNavigateToActiveCarbsDetails() { navigateToActiveCarbsDetailsText.safeTap() }
    public func getPumpPillValue() -> String { hudPumpPill.getValueSafe() }
    
    public func getHudGlucosePillValue() -> [String] {
        let outOfRangeValues = Set(["HIGH", "LOW"])
        var cgmValues = hudGlucosePill.getValueSafe().components(separatedBy: ", ")
        _ = hudGlucosePill.safeExists
        
        if outOfRangeValues.contains(where: { hudGlucosePill.identifier.hasSuffix($0) }) {
            let regex = try! Regex(#"\d+ "#) // Regex for "digit " when using mg/dL as units
            
            // identifier contains string as glucoseHUDView_LOW
            cgmValues[0] = cgmValues[0].replacing(regex) {
                match in "\(hudGlucosePill.identifier.components(separatedBy: "_")[1]) "
            }
            let regex = try! Regex(#"\d+\.\d+"#) // Regex for "digit.digit "
            
            // identifier contains string as glucoseHUDView_LOW
            cgmValues[0] = cgmValues[0].replacing(regex) { match in hudGlucosePill.identifier.components(separatedBy: "_")[1] }
        }
        return cgmValues
    }
    
    // MARK: Verifications
    
    public var bolusProgressTextExists: Bool { bolusProgressText.safeExists }
    public var tapToStopTextExists: Bool { tapToStopText.safeExists }
    public var hudStatusClosedLoopExists: Bool { hudStatusClosedLoop.waitForExistence(timeout: 120) }
    public var hudStatusOpenLoopExists: Bool { hudStatusOpenLoop.safeExists }
    public var closedLoopOffAlertTitleExists: Bool { closedLoopOffAlertTitle.safeExists }
    public var closedLoopOnAlertTitleExists: Bool { closedLoopOnAlertTitle.safeExists }
    public var navigationToGlucoseDetailsIsDisabled: Bool {
        navigateToGlucoseDetailsText.safeTap()
        let isDisabled = navigateToGlucoseDetailsText.safeExists
        
        if !isDisabled { NavigationBar(app: app).tapBackButton() }
        return isDisabled
    }
    
    public func pumpPillDisplaysValue(value: String) {
        XCTAssertTrue(hudPumpPill.getValueSafe().contains(NSLocalizedString(value, comment: "")))
    }
}
