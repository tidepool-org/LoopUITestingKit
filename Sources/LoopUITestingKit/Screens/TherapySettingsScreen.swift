//
//  TherapySettings.swift
//  LoopUITestingKit
//
//  Created by Petr Žywczok on 30.12.2024.
//

import XCTest

public final class TherapySettingsScreen: BaseScreen {

    // MARK: Elements
    
    private var baselRateTotalValueText: XCUIElement { app.staticTexts["basalRateTotalValue"] }
    private var maxBasalRateValueText: XCUIElement { app.staticTexts["maxBasalRateValue"].firstMatch }
    private var maxBolusValueText: XCUIElement { app.staticTexts["maxBolusValue"].firstMatch }
    private var carbRatioValueText: XCUIElement { app.staticTexts["carbRatioValue"] }
    private var workoutPresetValueText: XCUIElement { app.staticTexts["workoutPresetValue"] }
    private var preMealPresetValueText: XCUIElement { app.staticTexts["preMealPresetValue"] }
    private var glucoseSafetyLimitValueText: XCUIElement { app.staticTexts["glucoseSafetyLimitValue"] }
    private var pickerWheel: XCUIElement { app.pickerWheels.firstMatch }
    private var glucoseSafetyLimitAlertTitleText: XCUIElement { app.staticTexts["Save Glucose Safety Limit?"] }
    private var correctionRangeAlertTitleText: XCUIElement { app.staticTexts["Save Correction Range(s)?"] }
    private var preMealRangeAlertTitleText: XCUIElement { app.staticTexts["Save Pre-Meal Range?"] }
    private var workoutRangeAlertTitleText: XCUIElement { app.staticTexts["Save Workout Range?"] }
    private var carbRatiosAlertTitleText: XCUIElement { app.staticTexts["Save Carb Ratios?"] }
    private var goBackAlertButton: XCUIElement { app.buttons["Go Back"] }
    private var continueAlertButton: XCUIElement { app.buttons["Continue"] }
    private var guardrailWarningText: XCUIElement { app.staticTexts["text_guardrailWarning"] }
    private var confirmSaveButton: XCUIElement { app.buttons["button_confirmSave"] }
    private var therapySettingsEducationTitleText: XCUIElement { app.staticTexts["titleText_therapySettingsEducationTitle"] }
    private var setGlucoseValueText: XCUIElement { app.staticTexts["text_setGlucoseValue"].firstMatch }
    private var guardRailOrangeWarningTriangleImage: XCUIElement { app.images["image_warningTriangleOrange"] }
    private var guardRailRedWarningTriangleImage: XCUIElement { app.images["image_warningTriangleRed"] }
    private var nextToTextWarningTriangleRedImage: XCUIElement { app.images["imageNextToText_warningTriangleRed"] }
    private var nextToTextWarningTriangleOrangeImage: XCUIElement { app.images["imageNextToText_warningTriangleOrange"] }
    private var therapySettingsTitleText: XCUIElement { app.staticTexts["titleText_TherapySettings"] }
    private var saveSettingsButton: XCUIElement { app.buttons["button_save settings"] }
    private var infoCircleButton: XCUIElement { app.buttons["info.circle"] }
    private var addButton: XCUIElement { app.buttons["button_add"] }
    private var editButton: XCUIElement { app.buttons["button_edit"] }
    private var addNewEntryButton: XCUIElement { app.buttons["button_addNewEntry"] }
    private var cancelNewEntryButton: XCUIElement { app.buttons["button_cancelNewEntry"] }
    private var correctionRangeInformationText: XCUIElement { app.staticTexts["text_CorrectionRangeInformation"] }
    private var preMealPresetInformationText: XCUIElement { app.staticTexts["text_Pre-MealPresetInformation"] }
    private var workoutPresetInformationText: XCUIElement { app.staticTexts["text_WorkoutPresetInformation"] }
    private var carbRatiosInformationText: XCUIElement { app.staticTexts["text_CarbRatiosInformation"] }
    private var doneButton: XCUIElement { app.buttons["button_done"] }
    
    //MARK: Element Queries
    
    private var nextToTextWarningTriangleImages: XCUIElementQuery {
        app.images.matching(NSPredicate(format: "identifier CONTAINS 'imageNextToText_'"))
    }
    
    private var nextToTextWarningTriangleRedImages: XCUIElementQuery {
        app.images.matching(NSPredicate(format: "identifier == 'imageNextToText_warningTriangleRed'"))
    }

    private var nextToTextWarningTriangleOrangeImages: XCUIElementQuery {
        app.images.matching(NSPredicate(format: "identifier == 'imageNextToText_warningTriangleOrange'"))
    }
    
    private var insulinSensitivityValuesText: XCUIElementQuery {
        app.staticTexts.matching(NSPredicate(format: "identifier == 'insulinSensitivitySection'"))
    }
    
    private var basalRateValuesText: XCUIElementQuery {
        app.staticTexts.matching(NSPredicate(format: "identifier == 'basalRateValue'"))
    }
    
    private var sectionTitleText: XCUIElementQuery {
        app.staticTexts.matching(NSPredicate(format: "identifier CONTAINS 'titleText_'"))
    }
    
    private var sectionDescriptiveText: XCUIElementQuery {
        app.staticTexts.matching(NSPredicate(format: "identifier CONTAINS 'descriptiveText_'"))
    }
    
    private var scheduleItemText: XCUIElementQuery {
        app.staticTexts.matching(NSPredicate(format: "identifier CONTAINS 'schedule_item_'"))
    }
    
    private var correctionRangeValuesText: XCUIElementQuery {
        app.staticTexts.matching(NSPredicate(format: "identifier == 'correctionRangeValue'"))
    }
    
    private var carbRatiosValuesText: XCUIElementQuery {
        app.staticTexts.matching(NSPredicate(format: "identifier == 'carbRatioValue'"))
    }
        
    private var pickerWheels: XCUIElementQuery { app.pickerWheels }
    private var closeButtons: XCUIElementQuery { app.buttons.matching(identifier: "button_close") }
    
    //MARK: Actions
    
    public var getBaselRateTotalValue: String { baselRateTotalValueText.label }
    public var getMaxBasalRateValue: String { maxBasalRateValueText.label }
    public var getMaxBolusValue: String { maxBolusValueText.label }
    public var getCarbRatioValue: String { carbRatioValueText.label }
    public var getWorkoutPresetValue: String { workoutPresetValueText.label }
    public var getPreMealPresetValue: String { preMealPresetValueText.label }
    public var getGlucoseSafetyLimitValue: String { glucoseSafetyLimitValueText.getLableSafe() }
    public var getGuardrailWarningValue: String { guardrailWarningText.label }
    public var getTherapySettingsEducationTitleText: String { therapySettingsEducationTitleText.getLableSafe() }
    public var getTherapySettingsTitleText: String { therapySettingsTitleText.getLableSafe() }
    public var getCorrectionRangeValues: [String] { getElementsAttributes(correctionRangeValuesText) }
    public var getCarbRatiosValues: [String] { getElementsAttributes(carbRatiosValuesText) }
    public var getInsulinSensitivityUnitValues: [String] { getElementsAttributes(insulinSensitivityValuesText) }
    public var getbasalRateValues: [String] { getElementsAttributes(basalRateValuesText) }
    public var getSectionTitleValue: [String] { getElementsAttributes(sectionTitleText) }
    public var getSectionDescriptiveValue: [String] { getElementsAttributes(sectionDescriptiveText) }
    
    public var getNextToTextWarningTriangleImages: [String] {
        getElementsAttributes(nextToTextWarningTriangleImages, "identifier")
    }
    
    public var getNumberOfScheduledItems: Int {
        var numberOfItems = 0
        _ = scheduleItemText.firstMatch.safeExists
        
        for index in 0..<scheduleItemText.count {
            if app.staticTexts["schedule_item_\(index)"].exists { numberOfItems += 1 }
        }
        return numberOfItems
    }
    
    public var getNumberOfnextToTextWarningTriangleRedImages: Int {
        _ = nextToTextWarningTriangleRedImages.firstMatch.safeExists
        return nextToTextWarningTriangleRedImages.count
    }
    
    public var getNumberOfnextToTextWarningTriangleOrangeImages: Int {
        _ = nextToTextWarningTriangleOrangeImages.firstMatch.safeExists
        return nextToTextWarningTriangleOrangeImages.count
    }
    
    public var getXPositionOfnextToTextWarningTriangleRedImages: CGFloat {
        _ = nextToTextWarningTriangleRedImage.safeExists
        return nextToTextWarningTriangleRedImage.frame.midX
    }
    
    public var getXPositionOfnextToTextWarningTriangleOrangeImages: CGFloat {
        _ = nextToTextWarningTriangleOrangeImage.safeExists
        return nextToTextWarningTriangleOrangeImage.frame.midX
    }
    
    public func getPickerWheelsValues(attributeValues: [String]) -> [String: String] {
        let supportedValues = ["MinValue": 1, "MaxValue": 2, "Time": 0]
        var itemValues = [String: String]()
        
        for attributeValue in attributeValues {
            if !supportedValues.keys.contains(attributeValue) {
                XCTFail("Value '\(attributeValue)' is not supported. Supported values are: MinValue, MaxValue, Time.")
            }
            itemValues[attributeValue] = pickerWheels.element(boundBy: supportedValues[attributeValue]!).getValueSafe()
        }
        
        return itemValues
    }
    
    public func setPickerWheelValue(value: String) {
        _ = pickerWheelExists
        pickerWheel.adjust(toPickerWheelValue: value)
    }
    
    public func setScheduleItemValues(_ attributes: [(value: String, pickerWheel: Int)], _ maxSwipes: Int = 3) {
        for attribute in attributes {
            let value = attribute.value
            let pickerWheel = attribute.pickerWheel
            let swipeValues = ["lowest", "highest"]
            _ = pickerWheelExists
            
            if swipeValues.contains(value) {
                let pickerWheelToOperate = pickerWheels.element(boundBy: pickerWheel)
                
                for _ in 1...maxSwipes {
                    value == "lowest" ? pickerWheelToOperate.swipeDown(velocity: .fast) :
                    pickerWheelToOperate.swipeUp(velocity: .fast)
                }
            } else {
                if !value.isEmpty { pickerWheels.element(boundBy: pickerWheel).adjust(toPickerWheelValue: value) }
            }
        }
    }
    
    public func tapContinueAlertButton() { continueAlertButton.safeTap() }
    public func tapGoBackAlertButton() { goBackAlertButton.safeTap() }
    public func tapConfirmSaveButton() { confirmSaveButton.safeTap() }
    public func tapSetGlucoseValueText() { setGlucoseValueText.safeTap() }
    public func tapInfoCircleButton() { infoCircleButton.safeTap() }
    public func tapAddButton() { addButton.safeTap() }
    public func tapAddNewEntryButton() { addNewEntryButton.safeTap() }
    public func tapCancelNewEntryButton() { cancelNewEntryButton.safeTap() }
    public func tapEditButton() { editButton.safeTap() }
    public func tapDoneButton() { doneButton.safeTap() }
    
    public func tapSaveSettingsButton() {
        app.swipeToElement(element: saveSettingsButton, swipeDirection: .up, swipeVelocity: .fast)
        saveSettingsButton.safeTap()
    }
    
    public func tapScheduleItem(_ itemIndex: Int? = nil) {
        let indexValue = itemIndex != nil ? String(itemIndex!) : ""
        
        app.staticTexts
            .matching(NSPredicate(format: "identifier CONTAINS 'schedule_item_\(indexValue)'"))
            .firstMatch
            .safeTap()
    }
    
    public func tapCloseButton() {
        _ = closeButtons.firstMatch.safeExists
        for index in 0..<closeButtons.count {
            let element = closeButtons.element(boundBy: index)
            if element.isHittable {
                element.tap()
                break
            }
        }
    }
    
    public func getScheduleItemText(_ itemIndex: Int? = nil) -> String {
        let indexValue = itemIndex != nil ? String(itemIndex!) : ""
        
        return app.staticTexts
            .matching(NSPredicate(format: "identifier CONTAINS 'schedule_item_\(indexValue)'"))
            .matching(NSPredicate(format: "(label != 'Delete') AND (label != '－')"))
            .firstMatch
            .getLableSafe()
    }
    
    public func removeScheduleItem(itemIndex: Int) {
        let scheduleItem = app.staticTexts
            .matching(NSPredicate(format: "identifier CONTAINS 'schedule_item_\(itemIndex)'"))
        
        if itemIndex == 0 { XCTFail("Item with index '0' can't be removed.") }
        
        scheduleItem.matching(NSPredicate(format: "label == '－'")).firstMatch.safeTap()
        scheduleItem.matching(NSPredicate(format: "label == 'Delete'")).firstMatch.safeTap()
    }
        
    //MARK: Verifications
    
    public var therapySettingsTitleTextExists: Bool { therapySettingsTitleText.waitForExistence(timeout: 2) }
    public var editButtonExists: Bool { editButton.safeExists }
    public var infoCircleButtonExists: Bool { infoCircleButton.safeExists }
    public var addButtonExists: Bool { addButton.safeExists }
    public var confirmSaveButtonExists: Bool { confirmSaveButton.safeExists }
    public var correctionRangeInformationTextExists: Bool { correctionRangeInformationText.safeExists }
    public var preMealPresetInformationTextExists: Bool { preMealPresetInformationText.safeExists }
    public var workoutPresetInformationTextExists: Bool { workoutPresetInformationText.safeExists }
    public var carbRatiosInformationTextExists: Bool { carbRatiosInformationText.safeExists }
    public var goBackAlertButtonExists: Bool { goBackAlertButton.safeExists }
    public var glucoseSafetyLimitAlertExists: Bool { glucoseSafetyLimitAlertTitleText.safeExists }
    public var guardrailWarningTextExists: Bool { guardrailWarningText.safeExists }
    public var pickerWheelExists: Bool { pickerWheel.safeExists }
    public var guardRailOrangeWarningTriangleImageExists: Bool { guardRailOrangeWarningTriangleImage.safeExists }
    public var guardRailRedWarningTriangleImageExists: Bool { guardRailRedWarningTriangleImage.safeExists }
    public var nextToTextWarningTriangleRedImageExists: Bool { nextToTextWarningTriangleRedImage.safeExists }
    public var nextToTextWarningTriangleOrangeImageExists: Bool { nextToTextWarningTriangleOrangeImage.safeExists }
    public var correctionRangeAlertTitleTextExists: Bool { correctionRangeAlertTitleText.safeExists }
    public var preMealRangeAlertTitleTextExists: Bool { preMealRangeAlertTitleText.safeExists }
    public var workoutRangeAlertTitleTextExists: Bool { workoutRangeAlertTitleText.safeExists }
    public var carbRatiosAlertTitleTextExists: Bool { carbRatiosAlertTitleText.safeExists }
    
    public var removeScheduleItemButtonExists: Bool {
        scheduleItemText.matching(NSPredicate(format: "label == '－'")).firstMatch.safeExists
    }
    
    //MARK: Private Methods
    
    private func getElementsAttributes(_ elementQuery: XCUIElementQuery, _ attribute: String = "label") -> [String] {
        var elementsAttributes: [String] = []
        
        for index in 0..<elementQuery.count {
            switch attribute {
            case "label": elementsAttributes.append(elementQuery.element(boundBy: index).label)
            case "identifier": elementsAttributes.append(elementQuery.element(boundBy: index).identifier)
            default: XCTFail("Attribute '\(attribute)' is not implemented in test framework yet.")
            }
        }
        return elementsAttributes
    }
}
