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
    private var currentGlucoseEntryTextField: XCUIElement { app.textFields["textField_CurrentGlucose"] }
    private var fingerstickGlucoseTextField: XCUIElement { app.textFields["textField_FingerstickGlucose"] }
    private var bolusEntryTextField: XCUIElement { app.textFields["textField_Bolus"] }
    private var carbohydratesTextField: XCUIElement { app.textFields["textField_Carbohydrates"] }
    private var recommendedBolusStaticText: XCUIElement { app.staticTexts["staticText_RecommendedBolus"] }
    private var bolusCancelButton: XCUIElement { app.navigationBars.buttons["Cancel"] }
    private var simpleBolusCalculatorTitle: XCUIElement { app.navigationBars.staticTexts["Simple Bolus Calculator"] }
    private var bolusActionButton: XCUIElement { app.buttons["button_bolusAction"] }
    private var activeCarbsText: XCUIElement { app.staticTexts["text_ActiveCarbs"] }
    private var enterFingerstickGlucoseButton: XCUIElement { app.buttons["button_EnterFingerstickGlucose"] }
    
    private var keyboardDoneButton: XCUIElement { app.toolbars.firstMatch.buttons["Done"].firstMatch }
    
    // MARK: Actions
    
    public func tapBolusActionButton() { bolusActionButton.safeForceTap() }
    public func tapCancelBolusButton() { bolusCancelButton.safeTap() }
    public func tapCurrentGlucoseTextField() { currentGlucoseEntryTextField.safeTap() }
    public func tapFingerstickGlucoseTextField() { fingerstickGlucoseTextField.safeTap() }
    public func tapCarbohydratesTextField() { carbohydratesTextField.safeTap() }
    public func tapBolusTextField() { bolusEntryTextField.safeTap() }
    public func tapKeyboardDoneButton() { keyboardDoneButton.safeTap() }
    public func tapEnterFingerstickGlucoseButton() { enterFingerstickGlucoseButton.safeTap() }
    
    public var getCurrentGlucoseTextFieldValue: String { currentGlucoseEntryTextField.getValueSafe() }
    public var getFingerstickGlucoseTextFieldValue: String { fingerstickGlucoseTextField.getValueSafe() }
    public var getCarbohydratesTextFieldValue: String { carbohydratesTextField.getValueSafe() }
    public var getRecommendedBolusStaticTextValue: String { recommendedBolusStaticText.getLableSafe() }
    public var getBolusTextFieldValue: String { bolusEntryTextField.getValueSafe() }
    public var getBolusActionButtonLabel: String { bolusActionButton.getLableSafe() }
    public var getActiveCarbsText: String { activeCarbsText.getLableSafe() }
    
    public func clearCurrentGlucoseTextFieldValue() { currentGlucoseEntryTextField.clearTextField() }
    public func clearFingerstickGlucoseTextFieldValue() { fingerstickGlucoseTextField.clearTextField() }
    public func clearCarbohydratesTextFieldValue() { carbohydratesTextField.clearTextField() }
    public func clearBolusTextFieldValue() { bolusEntryTextField.clearTextField() }
    
    public func setCurrentGlucoseTextFieldValue(_ value: String) { currentGlucoseEntryTextField.typeText(value) }
    public func setFingerstickGlucoseTextFieldValue(_ value: String ) { fingerstickGlucoseTextField.typeText(value) }
    public func setCarbohydratesTextFieldValue(_ value: String) { carbohydratesTextField.typeText(value) }
    public func setBolusTextFieldValue(_ value: String) { bolusEntryTextField.typeText(value) }

    // MARK: Verifications
    
    public var bolusTitleExists: Bool { bolusTitleText.safeExists }
    public var fingerstickGlucoseTextFieldExists: Bool { fingerstickGlucoseTextField.safeExists }
    public var simpleBolusCalculatorTitleExists: Bool { simpleBolusCalculatorTitle.safeExists }
}
