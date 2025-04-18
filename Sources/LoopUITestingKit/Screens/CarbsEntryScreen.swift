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
    private var carbsConsumedTextField: XCUIElement { app.otherElements["textField_CarbsAmount"] }
    private var continueButton: XCUIElement { app.buttons["button_Continue"] }
    private var favoriteFoodsCollection: XCUIElement { app.collectionViews.firstMatch }
    private var consumeTimeText: XCUIElement { app.staticTexts["text_TimeCarbEntry"] }
    private var decreaseConsumeTimeButton: XCUIElement { app.buttons["button_TimeDecrement"] }
    private var increaseConsumeTimeButton: XCUIElement { app.buttons["button_TimeIncrement"] }
    private var absorbtionTimeText: XCUIElement { app.staticTexts["text_AbsorbtionTimeValue"] }
    private var foodTypeTextField: XCUIElement { app.textFields["textField_FoodType"] }
    
    // MARK: Actions
    
    public var getCarbsAmountValue: String { carbsConsumedTextField.getValueSafe() }
    public var getConsumedTimeText: String { consumeTimeText.getLableSafe().replacing(" ", with: " ") }
    public var getFoodTypeValue: String { foodTypeTextField.getValueSafe() }
    public var getAbsorbtionTimeText: String { absorbtionTimeText.getLableSafe() }

    public func tapCancelCarbsEntry() { cancelCarbsEntryButton.safeTap() }
    public func tapContinueButton() { continueButton.safeTap() }
    public func tapFoodType(foodType: String) { app.staticTexts[foodType].safeTap() }
    public func tapFoodTypeTextField() { foodTypeTextField.safeTap() }
    public func tapDecreaseConsumeTimeButton() { decreaseConsumeTimeButton.safeTap() }
    public func tapIncreaseConsumeTimeButton() { increaseConsumeTimeButton.safeTap() }
    
    public func setCarbsConsumedTextField(carbsAmount: String) {
        _ = carbsConsumedTextField.safeExists
        carbsConsumedTextField.doubleTap()
        carbsConsumedTextField.typeText(carbsAmount)
    }
    
    public func setFoodType(foodType: String) {
        let emojiToSelect = switch foodType {
        case "Slow": "🍕"
        case "Normal": "🌮"
        case "Fast": "🍭"
        case "Other": "🍽️"
        default: ""
        }
        
        if emojiToSelect.isEmpty { XCTFail("Food type '\(foodType)' is not supported by test framework yet.") }
        app.staticTexts[emojiToSelect].safeTap()
        if foodType == "Other" {
            for _ in 1...4 { navigateInFoodsCollection(direction: .left) }
            app.staticTexts["🍽"].safeTap()
        }
    }
    
    public func navigateInFoodsCollection(direction: SwipeDirection) {
        switch direction {
        case .left: favoriteFoodsCollection.swipeLeft(velocity: .slow)
        case .right: favoriteFoodsCollection.swipeRight(velocity: .fast)
        default: XCTFail("Only 'left' or 'right' direction is allowed for this collection element.")
        }
    }
    
    public func foodsCollectionContainsType(foodTypes: [String]) -> [String]? {
        var foodTypeNotDisplayed: [String]?
        
        for _ in 1...2 { navigateInFoodsCollection(direction: .right) }
        for foodType in foodTypes {
            for attempt in 1...4 {
                if attempt == 4 {
                    foodTypeNotDisplayed?.append(foodType)
                    break
                }
                if app.staticTexts[foodType].safeExists { break }
                navigateInFoodsCollection(direction: .left)
            }
        }
        return foodTypeNotDisplayed
    }
    
    public func getConsumeDateTime() -> Date {
        let pickerWheels = app.pickerWheels
        let todayFormatter =  DateFormatter()
        todayFormatter.dateFormat = "E, MMM dd"
        todayFormatter.locale = Locale(identifier: "en_US")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy E, MMM dd h:mm a"
        dateFormatter.locale = Locale(identifier: "en_US")

        if pickerWheels.count != 4 { consumeTimeText.safeTap() }
        
        let pickerWheelDay = pickerWheels.element(boundBy: 0).getValueSafe()
        let day = switch pickerWheelDay {
        case "Today": todayFormatter.string(from: Date.now)
        default: pickerWheelDay
        }
        let time = "\(pickerWheels.element(boundBy: 1).getValueSafe().components(separatedBy: " ")[0]):" +
            "\(pickerWheels.element(boundBy: 2).getValueSafe().components(separatedBy: " ")[0])"
        let year = Calendar.current.dateComponents([.year], from: Date()).year ?? 1970
        
        return dateFormatter.date(from: "\(year) \(day) \(time) \(pickerWheels.element(boundBy: 3).getValueSafe())")!
    }
    
    public func setConsumedTime(day: String? = nil, hours: String? = nil, minutes: String? = nil, amPm: String) {
        let pickerWheels = app.pickerWheels
        if pickerWheels.count != 4 { consumeTimeText.safeTap() }
        
        pickerWheels.element(boundBy: 3).adjust(toPickerWheelValue: amPm)
        if let minutes = minutes { pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: minutes) }
        if let hours = hours { pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: hours) }
        if let day = day { pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: day) }
        consumeTimeText.safeTap()
    }
    
    public func swipeDayPickerWheel(swipeDirection: SwipeDirection) {
        let pickerWheels = app.pickerWheels
        if pickerWheels.count != 4 { consumeTimeText.safeTap() }
        
        switch swipeDirection {
        case .down: pickerWheels.element(boundBy: 0).swipeDown()
        case .up: pickerWheels.element(boundBy: 0).swipeUp()
        default: XCTFail("Only 'up' and 'down' swipe directions are supported for pickerWheel.")
        }
    }
    
    public func setAbsorbtionTime(hours: String? = nil, minutes: String? = nil) {
        let pickerWheels = app.pickerWheels
        if pickerWheels.count != 2 { absorbtionTimeText.safeTap() }
        
        if let hours = hours { pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: hours) }
        if let minutes = minutes { pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: minutes) }
        absorbtionTimeText.safeTap()
    }
    
    // MARK: Verifications
    
    public var simpleMealCalculatorExists: Bool { simpleMealCalculatorTitleText.safeExists }
    public var carbEntryScreenExists: Bool { carbEntryTitleText.safeExists }
    public var foodTypeTextFieldExists: Bool { foodTypeTextField.safeExists }
}
