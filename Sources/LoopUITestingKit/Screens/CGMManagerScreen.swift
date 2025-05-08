//
//  CGMManagerScreen.swift
//  TidepoolSupport
//
//  Created by Petr Žywczok on 21.11.2024.
//

import XCTest

public final class CGMManagerScreen: BaseScreen {
    
    public enum MeasurementFrequency: String {
        case normal = "5 minutes"
        case fast = "1 minute"
        case faster = "5 seconds"
    }
    
    // MARK: Elements
    
    private var cgmSimulatorTitle: XCUIElement { app.navigationBars.staticTexts["CGM Simulator"] }
    private var cgmSimulatorDoneButton: XCUIElement { app.navigationBars["CGM Simulator"].buttons["Done"] }
    private var cgmSimulatorImage: XCUIElement { app.images["image_CgmSimulator"] }
    private var constantCell: XCUIElement { app.cells["cell_Constant"] }
    private var sineCurveCell: XCUIElement { app.cells["cell_SineCurve"] }
    private var baseGlucoseCell: XCUIElement { app.cells["cell_BaseGlucose"] }
    private var periodCell: XCUIElement { app.cells["cell_Period"] }
    private var amplitudeCell: XCUIElement { app.cells["cell_Amplitude"] }
    private var referenceDateCell: XCUIElement { app.cells["cell_ReferenceDate"] }
    private var measurementFrequencyCell: XCUIElement { app.cells["cell_MeasurementFrequency"] }
    private var glucoseNoiseCell: XCUIElement { app.cells["cell_GlucoseNoise"] }
    private var signalLossCell: XCUIElement { app.cells["cell_SignalLoss"] }
    private var backfillGlucoseCell: XCUIElement { app.cells["cell_BackfillGlucose"].firstMatch }
    private var warningThresholdCell: XCUIElement { app.cells["cell_WarningThreshold"].firstMatch }
    private var criticalThresholdCell: XCUIElement {
        app.swipeUp(velocity: .slow) // to avoid situation when screen automatically swipe and wrong element is selected
        return app.cells["cell_CriticalThreshold"].firstMatch
    }
    private var cgmUpperLimitCell: XCUIElement { app.cells["cell_CgmUpperLimit"].firstMatch }
    private var cgmLowerLimitCell: XCUIElement { app.cells["cell_CgmLowerLimit"] }
    private var highGlucoseThresholdCell: XCUIElement { app.cells["cell_HighGlucoseThreshold"] }
    private var lowGlucoseThresholdCell: XCUIElement { app.cells["cell_LowGlucoseThreshold"] }
    private var urgentLowGlucoseThresholdCell: XCUIElement { app.cells["cell_UrgentLowGlucoseThreshold"] }
    private var trendCell: XCUIElement { app.cells["cell_Trend"] }
    private var issueAlertsCell: XCUIElement { app.cells["cell_IssueAlerts"].firstMatch }
    private var percentCompletedCell: XCUIElement { app.cells["cell_PercentCompleted"] }
    private var glucoseLastReadingValueStaticText: XCUIElement {
        app.staticTexts["staticText_GlucoseLastReadingValue"]
    }
    
    // MARK: Element Queries
    
    private var pickerWheels: XCUIElementQuery { app.pickerWheels }
    
    // MARK: Actions
    
    public var cgmSimulatorDisplayed: Bool { cgmSimulatorTitle.safeExists }

    public func tapForDurationCgmSimulatorSettings() {
        if cgmSimulatorImage.safeExists {
            cgmSimulatorImage.press(forDuration: 6)
        }
    }
    
    public func tapCgmSimulatorDoneButton() { cgmSimulatorDoneButton.safeTap() }
    public func tapConstantCell() { constantCell.safeTap() }
    public func tapSineCurveCell() { sineCurveCell.safeTap() }
    public func tapMeasurementFrequencyCell() { measurementFrequencyCell.safeTap() }
    public func tapGlucoseNoiseCell() { glucoseNoiseCell.safeTap() }
    public func tapSignalLossCell() { signalLossCell.safeTap() }
    public func tapBackfillGlucoseCell() {
        app.swipeToElement(element: backfillGlucoseCell, swipeDirection: SwipeDirection.up, swipeVelocity: .fast)
        backfillGlucoseCell.safeTap()
    }
    public func tapWarningThresholdCell() { warningThresholdCell.safeTap() }
    public func tapCriticalThresholdCell() { criticalThresholdCell.safeTap() }
    public func tapCgmUpperLimitCell() { cgmUpperLimitCell.safeTap() }
    public func tapCgmLowerLimitCell() { cgmLowerLimitCell.safeTap() }
    public func tapHighGlucoseThresholdCell() { highGlucoseThresholdCell.safeTap() }
    public func tapLowGlucoseThresholdCell() { lowGlucoseThresholdCell.safeTap() }
    public func tapUrgentLowGlucoseThresholdCell() { urgentLowGlucoseThresholdCell.safeTap() }
    public func tapTrendCell() { trendCell.safeTap() }
    public func tapIssueAlertsCell() { issueAlertsCell.safeTap() }
    public func tapPercentCompletedCell() { percentCompletedCell.safeTap() }
    public func setMeasurementFrequency(frequency: MeasurementFrequency) { app.staticTexts[frequency.rawValue].safeTap() }
    
    public func setTimeValue(hours: String, minutes: String) {
        _ = pickerWheels.firstMatch.safeExists
        pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: hours)
        pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: minutes)
    }
    
    public func setGlucoseTrend(glucoseTrend: String) {
        app.descendants(matching: .staticText)
            .matching(NSPredicate(format: "label ENDSWITH '\(glucoseTrend)'"))
            .firstMatch
            .safeTap()
    }
    
    public func setSingleTextField(glucose: String) {
        let textField = app.textFields.firstMatch
        let currentTextLength = textField.getValueSafe().count
        
        textField.typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: currentTextLength))
        textField.typeText(glucose)
    }
    
    public func issueAlert(alertName: String) {
        app.descendants(matching: .staticText)
            .matching(NSPredicate(format: "label CONTAINS '\(alertName)'"))
            .firstMatch
            .safeTap()
    }
    
    // Sine Curve
    public func tapBaseGlucoseCell() { baseGlucoseCell.safeTap() }
    public func tapAmplitudeCell() { amplitudeCell.safeTap() }
    public func tapPeriodCell() { periodCell.safeTap() }
    public func tapReferenceDateCell() { referenceDateCell.safeTap() }
    
    // CGM Simulator Screen
    
    public var getGlucoseLastReadingValueStaticText: String { glucoseLastReadingValueStaticText.getLableSafe() }
}
