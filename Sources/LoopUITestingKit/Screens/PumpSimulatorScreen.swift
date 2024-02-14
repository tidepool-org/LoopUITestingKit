//
//  PumpSimulatorScreen.swift
//
//
//  Created by Cameron Ingham on 2/13/24.
//

import XCTest

public final class PumpSimulatorScreen: BaseScreen {

    // MARK: Elements
    
    public var suspendInsulinButton: XCUIElement {
        app.descendants(matching: .any).buttons["Suspend Insulin Delivery"]
    }
    
    public var resumeInsulinButton: XCUIElement {
        app.descendants(matching: .any).buttons["Tap to Resume Insulin Delivery"]
    }
    
    public var doneButton: XCUIElement {
        app.navigationBars["Pump Simulator"].buttons["Done"]
    }
    
    public var pumpProgressView: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "mockPumpManagerProgressView").firstMatch
    }
    
    public var reservoirRemainingButton: XCUIElement {
        app.descendants(matching: .any).matching(identifier: "mockPumpSettingsReservoirRemaining").firstMatch
    }
    
    public var reservoirRemainingTextField: XCUIElement {
        app.descendants(matching: .any).textFields.firstMatch
    }
    
    public var pumpSettingsBackButton: XCUIElement {
        app.navigationBars.firstMatch.buttons["Back"]
    }
    
    public var reservoirRemainingBackButton: XCUIElement {
        app.navigationBars.firstMatch.buttons["Back"]
    }
    
    public var detectOcclusionButton: XCUIElement {
        app.staticTexts["Detect Occlusion"]
    }
    
    public var resolveOcclusionButton: XCUIElement {
        app.staticTexts["Resolve Occlusion"]
    }
    
    public var causePumpErrorButton: XCUIElement {
        app.staticTexts["Cause Pump Error"]
    }
    
    public var resolvePumpErrorButton: XCUIElement {
        app.staticTexts["Resolve Pump Error"]
    }
    
    // MARK: Actions
    
    public func tapSuspendInsulinButton() {
        waitForExistence(suspendInsulinButton)
        suspendInsulinButton.tap()
    }
    
    public func tapResumeInsulinButton() {
        waitForExistence(resumeInsulinButton)
        resumeInsulinButton.tap()
    }
    
    public func closePumpSimulator() {
        waitForExistence(doneButton)
        doneButton.tap()
    }
    
    public func openPumpSettings() {
        waitForExistence(pumpProgressView)
        pumpProgressView.press(forDuration: 10)
    }
    
    public func closePumpSettings() {
        waitForExistence(pumpSettingsBackButton)
        pumpSettingsBackButton.tap()
    }
    
    public func tapReservoirRemainingRow() {
        waitForExistence(reservoirRemainingButton)
        reservoirRemainingButton.tap()
    }
    
    public func tapReservoirRemainingTextField() {
        waitForExistence(reservoirRemainingTextField)
        reservoirRemainingTextField.tap()
    }
    
    public func clearReservoirRemainingTextField() {
        guard let value = reservoirRemainingTextField.value as? String else {
            XCTFail()
            return
        }
        
        app.typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: value.count))
    }
    
    public func closeReservoirRemainingScreen() {
        waitForExistence(reservoirRemainingBackButton)
        reservoirRemainingBackButton.tap()
    }
    
    public func tapDetectOcclusionButton() {
        waitForExistence(detectOcclusionButton)
        detectOcclusionButton.tap()
    }
    
    public func tapResolveOcclusionButton() {
        waitForExistence(resolveOcclusionButton)
        resolveOcclusionButton.tap()
    }
    
    public func tapCausePumpErrorButton() {
        waitForExistence(causePumpErrorButton)
        causePumpErrorButton.tap()
    }
    
    public func tapResolvePumpErrorButton() {
        waitForExistence(resolvePumpErrorButton)
        resolvePumpErrorButton.tap()
    }
}
