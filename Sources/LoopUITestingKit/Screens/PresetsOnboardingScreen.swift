//
//  PresetsOnboardingScreen.swift
//  LoopUITestingKit
//
//  Created by Scott Foster on 10/27/25.
//

import XCTest

public final class PresetsOnboardingScreen: BaseScreen {
    
    // MARK: Elements
    private var presetsTrainingTitleText: XCUIElement { app.staticTexts["Presets Training"] }
    private var trainingCompleteSkipOption: XCUIElement { app.buttons["Training Complete"] }
    private var presetsTrainingCard: XCUIElement { app.images["button_presetTrainingCard"] }

    // MARK: Actions
    public func tapForDurationPresetsTrainingTitleText() {
        if presetsTrainingTitleText.safeExists{
            presetsTrainingTitleText.press(forDuration: 6);
        }
    }
    public func tapTrainingCompleteSkipOption() { trainingCompleteSkipOption.safeTap() }
    public func tapPresetsTrainingCard() { presetsTrainingCard.safeTap() }
    
    // MARK: Verifications
    public var presetsTrainingTitleTextExists: Bool { presetsTrainingTitleText.safeExists }
    public var presetsTrainingCardExists: Bool { presetsTrainingCard.safeExists }

}

