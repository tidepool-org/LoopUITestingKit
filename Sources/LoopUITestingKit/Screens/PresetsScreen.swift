//
//  PresetsScreen.swift
//  LoopUITestingKit
//
//  Created by Petr Žywczok on 05.02.2025.
//

import XCTest

public final class PresetsScreen: BaseScreen {
    
    // MARK: Elements
    
    private var preMealCorrectionRangeText: XCUIElement {
        app.staticTexts.matching(NSPredicate(format: "identifier CONTAINS 'text_PresetCorrectionRange'"))
            .element(boundBy: 0)
    }
    private var workoutCorrectionRangeText: XCUIElement {
        app.staticTexts.matching(NSPredicate(format: "identifier CONTAINS 'text_PresetCorrectionRange'"))
            .element(boundBy: 1)
    }
    
    // MARK: Actions
    
    public var getPreMealCorrectionRangeText: String { preMealCorrectionRangeText.getLableSafe() }
    public var getWorkoutCorrectionRangeText: String { workoutCorrectionRangeText.getLableSafe()}
}
