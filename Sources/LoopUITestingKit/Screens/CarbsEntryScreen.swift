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
    
    // MARK: Actions
    
    public func tapCancelCarbsEntry() { cancelCarbsEntryButton.safeTap() }
    
    // MARK: Verifications
    
    public var simpleMealCalculatorExists: Bool { simpleMealCalculatorTitleText.safeExists }
    public var carbEntryScreenExists: Bool { carbEntryTitleText.safeExists }
}
