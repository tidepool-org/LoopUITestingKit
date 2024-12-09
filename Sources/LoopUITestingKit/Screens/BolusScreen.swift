//
//  BolusScreen.swift
//  TidepoolSupport
//
//  Created by Petr Žywczok on 23.11.2024.
//

import XCTest

public final class BolusScreen: BaseScreen {
    
    // MARK: Elements

    private var bolusTitleText: XCUIElement { app.navigationBars.staticTexts["Bolus"] }
    private var bolusEntryTextField: XCUIElement { app.textFields["dismissibleKeyboardTextField"] }
    private var bolusCancelButton: XCUIElement { app.navigationBars.buttons["Cancel"] }
    private var simpleBolusCalculatorTitle: XCUIElement { app.navigationBars.staticTexts["Simple Bolus Calculator"] }
    private var deliverBolusButton: XCUIElement { app.buttons["Deliver"] }
    private var passcodeEntry: XCUIElement { springBoard.secureTextFields["Passcode field"] }
    private var keyboardDoneButton: XCUIElement { app.toolbars.firstMatch.buttons["Done"].firstMatch }
    
    // MARK: Actions
    
    public func tapCancelBolusButton() {
        bolusCancelButton.safeTap()
    }
    
    public func tapBolusEntryTextField() {
        bolusEntryTextField.safeTap()
    }
    
    public func tapDeliverBolusButton() {
        deliverBolusButton.safeForceTap()
    }
    
    public func clearBolusEntryTextField() {
        let currentTextLength = bolusEntryTextField.getValueSafe().count
        
        bolusEntryTextField
            .typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: currentTextLength))
    }
    
    public func setPasscode() {
        passcodeEntry.safeTap()
        passcodeEntry.typeText("1\n")
    }
    
    public func setBolusEntryTextField(value: String) {
        bolusEntryTextField.typeText(value)
    }
    
    public func tapKeyboardDoneButton() {
        keyboardDoneButton.safeTap()
    }
    
    // MARK: Verifications
    
    public var bolusTitleExists: Bool {
        bolusTitleText.safeExists
    }
    
    public var simpleBolusCalculatorTitleExists: Bool {
        simpleBolusCalculatorTitle.safeExists
    }
}
