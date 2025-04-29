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
    private var editPresetButton: XCUIElement { app.buttons["button_EditPreset"] }
    private var correctionRangeButton: XCUIElement { app.buttons["button_CorrectionRange"] }
    private var cancelButton: XCUIElement { app.buttons["button_Cancel"] }
    private var saveButton: XCUIElement { app.buttons["button_Save"] }
    private var adjustCorrectionRangeText: XCUIElement { app.staticTexts["text_AdjustedCorrectionRange"] }
    private var correctionValueRedWarningText: XCUIElement {
        app.staticTexts["image_warningTriangleRed-text_guardrailWarning"]
    }
    private var correctionValueOrangeWarningText: XCUIElement {
        app.staticTexts["image_warningTriangleOrange-text_guardrailWarning"]
    }
    private var correctionRangePreviewAdjustedRangeText: XCUIElement { app.staticTexts["text_CorrectionRangePreview"] }
    private var correctionRangePreviewWarningText: XCUIElement { app.staticTexts["text_CorrectionRangeWarning"] }
    private var startPresetButton: XCUIElement { app.buttons["button_startPreset"] }
    private var allPresetsText: XCUIElement { app.staticTexts["text_AllPresets"] }
    private var presetWorkoutText: XCUIElement { app.staticTexts["text_PresetWorkout"] }
    private var presetPreMealText: XCUIElement { app.staticTexts["text_PresetPre-Meal"] }
    private var endPresetButton: XCUIElement { app.buttons["button_endPreset"] }
    private var adjustPresetDurationButton: XCUIElement { app.buttons["button_adjustPresetDuration"] }
    private var closeButton: XCUIElement { app.buttons["button_close"] }
    private var presetTimePickerButton: XCUIElement { app.buttons["Time Picker"] } // ID is default label for timePicker
    private var presetActionSheetActiveOnText: XCUIElement { app.staticTexts["text_PresetActionSheetActiveOn"] }
    
    // MARK: Actions
    
    public var getPreMealCorrectionRangeText: String { preMealCorrectionRangeText.getLableSafe() }
    public var getWorkoutCorrectionRangeText: String { workoutCorrectionRangeText.getLableSafe() }
    public var getAdjustedCorrectionRangeText: String { adjustCorrectionRangeText.getLableSafe() }
    public var getCorrectionRangePreviewWarningText: String { correctionRangePreviewWarningText.getLableSafe() }
    public var getPresetTimePickerButton: String { presetTimePickerButton.getValueSafe() }
    public var getPresetActionSheetActiveOnText: String { presetActionSheetActiveOnText.getLableSafe() }
    public var getCorrectionRangePreviewAdjustedRangeText: String {
        correctionRangePreviewAdjustedRangeText.getLableSafe()
    }
    public var getAllPresetsTextYPosition: CGFloat {
        _ = allPresetsText.safeExists
        return allPresetsText.frame.minY
    }
    public var getPresetWorkoutTextYPosition: CGFloat {
        _ = presetWorkoutText.safeExists
        return presetWorkoutText.frame.minY
    }
    public var getPresetPreMealTextYPosition: CGFloat {
        _ = presetPreMealText.safeExists
        return presetPreMealText.frame.minY
    }
    
    public func setPresetDuration(minutesAdjustment: String, hoursAdjustment: String, amPm: String = "AM") {
        let pickerWheels = app.pickerWheels
        
        presetTimePickerButton.safeTap()
        
        pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: hoursAdjustment)
        pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: minutesAdjustment)
        pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: amPm)
    }
    
    public func tapPresetWorkoutText() { presetWorkoutText.safeTap() }
    public func tapPresetPreMealText() { presetPreMealText.safeTap() }
    public func tapEditPresetButton() { editPresetButton.safeTap() }
    public func tapCorrectionRangeButton() { correctionRangeButton.safeTap() }
    public func tapCancelButton() { cancelButton.safeTap() }
    public func tapSaveButton() {
        if !saveButton.isHittableSafe { saveButton.swipeUp() }
        saveButton.safeTap()
    }
    public func tapStartPresetButton() { startPresetButton.safeTap() }
    public func tapEndPresetButton() { endPresetButton.safeTap() }
    public func tapAdjustPresetDurationButton() { adjustPresetDurationButton.safeTap() }
    public func tapCloseButton() { closeButton.safeTap() }
    public func tapPresetTimePickerButton() { presetTimePickerButton.safeTap() }
    
    // MARK: Verifications
    
    public var correctionValueRedWarningTextExists: Bool { correctionValueRedWarningText.safeExists }
    public var correctionValueOrangeWarningTextExists: Bool { correctionValueOrangeWarningText.safeExists }
    public var presetActionSheetActiveOnTextExists: Bool { presetActionSheetActiveOnText.safeExists }
    
    public func presetHasEndedWithintDuration(duration: TimeInterval) -> Bool {
        startPresetButton.waitForExistence(timeout: duration) && endPresetButton.waitForNonExistence(timeout: duration)
    }
}
