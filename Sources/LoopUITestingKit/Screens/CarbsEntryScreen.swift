//
//  CarbsEntryScreen.swift
//  TidepoolSupport
//
//  Created by Petr Žywczok on 23.11.2024.
//

import XCTest

public final class CarbsEntryScreen: BaseScreen {
    
    // MARK: Elements
    
    private var simpleMealCalculatorTitleText: XCUIElement { app.navigationBars.staticTexts["Simple Meal Calculator"] }
    private var cancelCarbsEntryButton: XCUIElement { app.navigationBars.buttons["Cancel"] }
    private var carbEntryTitleText: XCUIElement { app.navigationBars.staticTexts["Add Carb Entry"] }
    private var carbsConsumedTextField: XCUIElement { app.textFields["textField_CarbsAmount"] }
    private var continueButton: XCUIElement { app.buttons["button_Continue"] }
    private var mealBolusTitleText: XCUIElement { app.navigationBars.staticTexts["Meal Bolus"] }
    private var bolusingText: XCUIElement { app.navigationBars.staticTexts["Bolused %1$@ of %2$@"] }

    private var tapToStopActionButton: XCUIElement { app.buttons["Tap to Stop"] }

    private var cancelingBolusText: XCUIElement { app.navigationBars.staticTexts["Canceling Bolus"] }

    private var bolusCanceledText: XCUIElement { app.navigationBars.staticTexts["Bolus Canceled: Delivered %1$@ of %2$@"] }
    
    // MARK: Actions
    
    public func tapCancelCarbsEntry() { cancelCarbsEntryButton.safeTap() }
    public func tapContinueButton() { continueButton.safeTap() }
    
    public func setCarbsConsumedTextField(carbsAmount: String) {
        _ = carbsConsumedTextField.safeExists
        carbsConsumedTextField.typeText(carbsAmount)
    }
    
    public func setFoodType(foodType: String) {
        let emojiToSelect = switch foodType {
        case "Slow": "🍕"
        case "Normal": "🌮"
        case "Fast": "🍭"
        default: ""
        }
        
        if emojiToSelect.isEmpty { XCTFail("Food type '\(foodType)' is not supported by test framework yet.") }
        app.staticTexts[emojiToSelect].safeTap()
    }
     public func taptapToStopActionButton() { tapToStopActionButton.safeTap() }
    
    // MARK: Verifications
    
    public var simpleMealCalculatorExists: Bool { simpleMealCalculatorTitleText.safeExists }
    public var carbEntryScreenExists: Bool { carbEntryTitleText.safeExists }
    public var mealBolusScreenExists: Bool { mealBolusTitleText.safeExists }
}
