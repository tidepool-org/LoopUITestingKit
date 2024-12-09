//
//  PumpSimulatorScreen.swift
//  TidepoolSupport
//
//  Created by Petr Žywczok on 19.11.2024.
//

import XCTest

public final class PumpManagerScreen: BaseScreen {

    // MARK: Elements
    
    private var suspendInsulinButton: XCUIElement { app.descendants(matching: .any).buttons["Suspend Insulin Delivery"] }
    private var resumeInsulinButton: XCUIElement {
        app.descendants(matching: .any).buttons["Tap to Resume Insulin Delivery"]
    }
    private var doneButton: XCUIElement { app.navigationBars["Pump Simulator"].buttons["Done"] }
    private var pumpManagerProgressImage: XCUIElement { app.images["mockPumpManagerProgressView"] }
    private var reservoirRemainingButton: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "mockPumpSettingsReservoirRemaining").firstMatch
    }
    private var reservoirRemainingTextField: XCUIElement { app.descendants(matching: .any).textFields.firstMatch }
    private var pumpSettingsBackButton: XCUIElement { app.navigationBars.buttons["Back"] }
    private var reservoirRemainingBackButton: XCUIElement { app.navigationBars.firstMatch.buttons["Back"] }
    private var detectOcclusionButton: XCUIElement { app.staticTexts["Detect Occlusion"] }
    private var resolveOcclusionButton: XCUIElement { app.staticTexts["Resolve Occlusion"] }
    private var causePumpErrorButton: XCUIElement { app.staticTexts["Cause Pump Error"] }
    private var resolvePumpErrorButton: XCUIElement { app.staticTexts["Resolve Pump Error"] }
    private var pumpSimulatorTitle: XCUIElement { app.navigationBars.staticTexts["Pump Simulator"] }
    
    // MARK: Actions
    
    public func tapSuspendInsulinButton() {
        suspendInsulinButton.safeTap()
    }
    
    public func tapResumeInsulinButton() {
        resumeInsulinButton.safeTap()
    }
    
    public func tapPumpSimulatorDoneButton() {
        doneButton.safeTap()
    }
    
    public func tapPumpManagerProgressImage() {
        pumpManagerProgressImage.press(forDuration: 10)
    }
    
    public func tapPumpSettingsBackButton() {
        pumpSettingsBackButton.safeTap()
    }
    
    public func tapReservoirRemainingRow() {
        reservoirRemainingButton.safeTap()
    }
    
    public func tapReservoirRemainingTextField() {
        reservoirRemainingTextField.safeTap()
    }
    
    public func clearReservoirRemainingTextField() {
        let currentTextLength = reservoirRemainingTextField.getValueSafe().count
        
        reservoirRemainingTextField
            .typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: currentTextLength))
    }
    
    public func closeReservoirRemainingScreen() {
        reservoirRemainingBackButton.safeTap()
    }
    
    public func setReservoirRemainingText(value: String) {
        reservoirRemainingTextField.typeText(value)
    }
    
    public func tapDetectOcclusionButton() {
        detectOcclusionButton.safeTap()
    }
    
    public func tapResolveOcclusionButton() {
        resolveOcclusionButton.safeTap()
    }
    
    public func tapCausePumpErrorButton() {
        causePumpErrorButton.safeTap()
    }
    
    public func tapResolvePumpErrorButton() {
        resolvePumpErrorButton.safeTap()
    }
    
    // MARK: Verifications
    
    public var pumpSimulatorDisplayed: Bool {
        pumpSimulatorTitle.safeExists
    }
    
    public var resumeInsulinButtonExists: Bool {
        resumeInsulinButton.safeExists
    }
    
    public var suspendInsulinButtonExists: Bool {
        suspendInsulinButton.safeExists
    }
}
