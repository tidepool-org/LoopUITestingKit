//
//  BolusScreen.swift
//  TidepoolSupport
//
//  Created by Petr Žywczok on 23.11.2024.
//

import XCTest

public final class BolusScreen: BaseScreen {
    
    public enum fieldName {
        case currentGlucose
        case carbohydrates
        case recommendedBolus
        case bolus
    }
    
    // MARK: Elements

    private var bolusTitleText: XCUIElement { app.navigationBars.staticTexts["Bolus"] }
    private var currentGlucoseEntryTextField: XCUIElement { app.textFields["textField_CurrentGlucose"]}
    private var bolusEntryTextField: XCUIElement { app.textFields["textField_Bolus"]}
    private var carbohydratesTextField: XCUIElement { app.textFields["textField_Carbohydrates"]}
    private var recommendedBolusStaticText: XCUIElement { app.staticTexts["staticText_RecommendedBolus"]}
    private var bolusCancelButton: XCUIElement { app.navigationBars.buttons["Cancel"] }
    private var simpleBolusCalculatorTitle: XCUIElement { app.navigationBars.staticTexts["Simple Bolus Calculator"] }
    private var bolusActionButton: XCUIElement { app.buttons["button_bolusAction"] }
    
    private var passcodeEntry: XCUIElement { springBoard.secureTextFields["Passcode field"] }
    private var keyboardDoneButton: XCUIElement { app.toolbars.firstMatch.buttons["Done"].firstMatch }
    
    // MARK: Actions
    
    public func tapTextField(fieldName: fieldName) {
        switch fieldName {
        case .currentGlucose:
            currentGlucoseEntryTextField.safeTap()
        case .carbohydrates:
            carbohydratesTextField.safeTap()
        case .recommendedBolus:
            recommendedBolusStaticText.safeTap()
        case .bolus:
            bolusEntryTextField.safeTap()
        }
    }
    
    public func getTextField(fieldName: fieldName) -> String {
        switch fieldName {
        case .currentGlucose:
            return currentGlucoseEntryTextField.getValueSafe()
        case .carbohydrates:
            return carbohydratesTextField.getValueSafe()
        case .recommendedBolus:
            return recommendedBolusStaticText.getValueSafe()
        case .bolus:
            return bolusEntryTextField.getValueSafe()
        }
    }
    
    public func clearTextField(fieldName: fieldName) {
        let currentTextLength: Int
        switch fieldName {
        case .currentGlucose:
            currentTextLength = currentGlucoseEntryTextField.getValueSafe().count
            currentGlucoseEntryTextField.typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: currentTextLength))
        case .carbohydrates:
            currentTextLength = carbohydratesTextField.getValueSafe().count
            carbohydratesTextField.typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: currentTextLength))
        case .recommendedBolus:
            XCTFail("Recommended Bolus is not an editable text field. It is a static text")
        case .bolus:
            currentTextLength = bolusEntryTextField.getValueSafe().count
            bolusEntryTextField.typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: currentTextLength))
        }
    }
    
    public func setTextField(fieldName: fieldName, value: String) {
        switch fieldName {
        case .currentGlucose:
            currentGlucoseEntryTextField.typeText(value)
        case .carbohydrates:
            carbohydratesTextField.typeText(value)
        case .recommendedBolus:
            XCTFail("Recommended Bolus is not an editable text field. It is a static text")
        case .bolus:
            bolusEntryTextField.typeText(value)
        
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
