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
    private var navigateToGlucoseDetailsText: XCUIElement {
        app.descendants(matching: .staticText)
            .matching(NSPredicate(format: "identifier CONTAINS 'chartTitleText_Glucose'"))
            .firstMatch
    }
    private var navigateToActiveCarbsDetailsText: XCUIElement {
        app.descendants(matching: .staticText)
            .matching(NSPredicate(format: "identifier CONTAINS 'chartTitleText_ActiveCarbs'"))
            .firstMatch
    }
    private var navigateToActiveInsulinDetailsText: XCUIElement {
        app.descendants(matching: .staticText)
            .matching(NSPredicate(format: "identifier CONTAINS 'chartTitleText_ActiveInsulin'"))
            .firstMatch
    }
    private var percentCompletedProgressBar: XCUIElement {
        app.progressIndicators.matching(NSPredicate(format: "identifier CONTAINS 'progressBar_State_'"))
            .firstMatch
    }
    private var bolusProgressText: XCUIElement { app.staticTexts["text_BolusingProgress"] }
    private var tapToStopText: XCUIElement { app.staticTexts["text_TapToStop"] }
    private var bolusCanceledText: XCUIElement { app.staticTexts["text_BolusCanceled"] }
    private var insulinSuspendedText: XCUIElement { app.staticTexts["text_InsulinSuspended"] }
    private var insulinTapToResumeText: XCUIElement { app.staticTexts["text_InsulinTapToResume"] }
    private var workoutPresetCellTitle: XCUIElement { app.staticTexts["text_WorkoutPresetCellTitle"] }
    private var preMealPresetCellTitle: XCUIElement { app.staticTexts["text_PreMealPresetCellTitle"] }
    private var presetActiveOnText: XCUIElement { app.staticTexts["text_PresetActiveOn"] }
    private var presetsToolbarImage: XCUIElement { app.images["image_Presets"] }
    private var presetsSelectedToolbarImage: XCUIElement { app.images["image_PresetsSelected"] }
    private var activeInsulinLastBolusText: XCUIElement { app.staticTexts["text_ActiveInsulinFooter"] }
    
    // MARK: Actions
    
    public var getPercentCompletedProgressbarValue: String { percentCompletedProgressBar.getValueSafe() }
    public var getPercentCompletedProgressbarState: String { percentCompletedProgressBar.identifier.components(separatedBy: "_")[2] }
    public var getBolusProgressText: String { bolusProgressText.getLableSafe() }
    public var getActiveCarbsValue: String {
        _ = navigateToActiveCarbsDetailsText.safeExists
        return navigateToActiveCarbsDetailsText.identifier.components(separatedBy: "_")[2]
    }
    public var getActiveInsulinXAxisCount: Int {
        _ = navigateToActiveInsulinDetailsText.safeExists
        return Int(navigateToActiveInsulinDetailsText.identifier.components(separatedBy: "_")[3]) ?? -1
    }
    public var getGlucoseXAxisCount: Int {
        _ = navigateToGlucoseDetailsText.safeExists
        return Int(navigateToGlucoseDetailsText.identifier.components(separatedBy: "_")[2]) ?? -1
    }
    public var getActiveCarbsXAxisCount: Int {
        _ = navigateToActiveCarbsDetailsText.safeExists
        return Int(navigateToActiveCarbsDetailsText.identifier.components(separatedBy: "_")[3]) ?? -1
    }
    public var getPresetActiveOnText: String { presetActiveOnText.getLableSafe() }
    public var getActiveInsulinLastBolusValue: String { activeInsulinLastBolusText.getLableSafe() }

    public func getPumpPillValue() -> String { hudPumpPill.getValueSafe() }
    public func getHudGlucosePill() -> String { hudGlucosePill.getValueSafe() }

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
    public func tapNavigateToActiveInsulinDetailsText() { navigateToActiveInsulinDetailsText.safeTap() }
    public func tapTapToStop() { tapToStopText.safeTap() }
    public func tapInsulinTapToResumeCell() { insulinTapToResumeText.safeTap() }
    public func tapWorkoutPresetCellTitle() { workoutPresetCellTitle.safeTap() }
    public func tapPreMealPresetCellTitle() { preMealPresetCellTitle.safeTap() }

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
        }
        return cgmValues
    }
    
    // MARK: Verifications
    
    public var carbsTabButtonisHittable: Bool { carbsTabButton.isHittableSafe }
    public var bolusProgressTextExists: Bool { bolusProgressText.safeExists }
    public var bolusProgressTextNotExists: Bool { bolusProgressText.waitForNonExistence(timeout: 120) }
    public var tapToStopTextExists: Bool { tapToStopText.safeExists }
    public var hudStatusClosedLoopExists: Bool { hudStatusClosedLoop.waitForExistence(timeout: 120) }
    public var hudStatusClosedLoopNotExists: Bool { hudStatusClosedLoop.waitForNonExistence(timeout: 5) }
    public var hudStatusOpenLoopExists: Bool { hudStatusOpenLoop.safeExists }
    public var hudStatusOpenLoopNotExists: Bool { hudStatusOpenLoop.waitForNonExistence(timeout: 5) }
    public var closedLoopOffAlertTitleExists: Bool { closedLoopOffAlertTitle.safeExists }
    public var closedLoopOnAlertTitleExists: Bool { closedLoopOnAlertTitle.safeExists }
    public var bolusCanceledTextExists: Bool { bolusCanceledText.safeExists }
    public var bolusCanceledTextNotExists: Bool { bolusCanceledText.waitForNonExistence(timeout: 11) }
    public var insulinTapToResumeTextExists: Bool { insulinTapToResumeText.safeExists }
    public var insulinTapToResumeTextNotExists: Bool { insulinTapToResumeText.waitForNonExistence(timeout: 11) }
    public var insulinSuspendedTextExists: Bool { insulinSuspendedText.safeExists }
    public var insulinSuspendedTextNotExists: Bool { insulinSuspendedText.waitForNonExistence(timeout: 11) }
    public var workoutPresetCellTitleExists: Bool { workoutPresetCellTitle.safeExists }
    public var workoutPresetCellTitleNotExists: Bool { workoutPresetCellTitle.waitForNonExistence(timeout: 5) }
    public var preMealPresetCellTitleExists: Bool { preMealPresetCellTitle.safeExists }
    public var preMealPresetCellTitleNotExists: Bool { preMealPresetCellTitle.waitForNonExistence(timeout: 5) }
    public var presetsToolbarImageExists: Bool { presetsToolbarImage.safeExists }
    public var presetsSelectedToolbarImageExists: Bool { presetsSelectedToolbarImage.safeExists }
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
