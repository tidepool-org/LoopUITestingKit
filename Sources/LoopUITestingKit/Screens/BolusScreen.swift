//
//  BolusScreen.swift
//  TidepoolSupport
//
//  Created by Petr Žywczok on 23.11.2024.
//

import XCTest

public final class BolusScreen: BaseScreen {
    
    public enum fieldName {
        case bolus
        case currentGlucose
        case carbohydrates
    }
    
    // MARK: Elements

    private var bolusTitleText: XCUIElement { app.navigationBars.staticTexts["Bolus"] }
    private var currentGlucoseEntryTextField: XCUIElement { app.textFields["textField_CurrentGlucose"]}
    private var bolusEntryTextField: XCUIElement { app.textFields["textField_Bolus"]}
    private var carbohydratesTextField: XCUIElement { app.textFields["textField_Carbohydrates"]}
    private var bolusCancelButton: XCUIElement { app.navigationBars.buttons["Cancel"] }
    private var simpleBolusCalculatorTitle: XCUIElement { app.navigationBars.staticTexts["Simple Bolus Calculator"] }
    private var bolusActionButton: XCUIElement { app.buttons["button_bolusAction"] }
    
    private var passcodeEntry: XCUIElement { springBoard.secureTextFields["Passcode field"] }
    private var keyboardDoneButton: XCUIElement { app.toolbars.firstMatch.buttons["Done"].firstMatch }
    
    // MARK: Actions
    
    public func tapTextField(fieldName: fieldName) {
        switch fieldName {
        case .bolus:
            bolusEntryTextField.safeTap()
        case .currentGlucose:
            currentGlucoseEntryTextField.safeTap()
        case .carbohydrates:
            carbohydratesTextField.safeTap()
        }
    }
    
    public func getTextFieldValue(fieldName: fieldName) -> String {
        switch fieldName {
        case .bolus:
            return bolusEntryTextField.getValueSafe()
        case .currentGlucose:
            return currentGlucoseEntryTextField.getValueSafe()
        case .carbohydrates:
            return carbohydratesTextField.getValueSafe()
        }
    }
    
    public func clearTextField(fieldName: fieldName) {
        let currentTextLength: Int
        switch fieldName {
        case .bolus:
            currentTextLength = bolusEntryTextField.getValueSafe().count
            bolusEntryTextField.typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: currentTextLength))
        case .currentGlucose:
            currentTextLength = currentGlucoseEntryTextField.getValueSafe().count
            currentGlucoseEntryTextField.typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: currentTextLength))
        case .carbohydrates:
            currentTextLength = carbohydratesTextField.getValueSafe().count
            carbohydratesTextField.typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: currentTextLength))
        }
    }
    
    public func setTextField(fieldName: fieldName, value: String) {
        switch fieldName {
        case .bolus:
            bolusEntryTextField.typeText(value)
        case .currentGlucose:
            currentGlucoseEntryTextField.typeText(value)
        case .carbohydrates:
            carbohydratesTextField.typeText(value)
        }
    }
    
    public func tapCancelBolusButton() { bolusCancelButton.safeTap() }
    public func tapBolusActionButton() { bolusActionButton.safeForceTap() }
    public var getBolusActionButtonLabel: String { bolusActionButton.getLableSafe() }
    
    public func setPasscode() {
        passcodeEntry.safeTap()
        passcodeEntry.typeText("1\n")
    }
    
    public func tapKeyboardDoneButton() { keyboardDoneButton.safeTap() }
    
    // MARK: Verifications
    
    public var bolusTitleExists: Bool { bolusTitleText.safeExists }
    public var simpleBolusCalculatorTitleExists: Bool { simpleBolusCalculatorTitle.safeExists }
}
