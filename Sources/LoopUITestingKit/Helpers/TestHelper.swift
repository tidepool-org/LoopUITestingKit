//
//  TestHelper.swift
//  TidepoolSupport
//
//  Created by Petr Žywczok on 14.11.2024.
//
import XCTest

public class TestHelper {
    static func waitForExistence(
        _ element: XCUIElement,
        timeout: TimeInterval = Double(20),
        assert: Bool = true,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        if assert {
            XCTAssert(
                element.waitForExistence(timeout: timeout),
                file: file,
                line: line
            )
        } else {
            _ = element.waitForExistence(timeout: timeout)
        }
    }
    
    public static func getSecondsToAdjust(timeAdjustment: String) -> Double {
        var timeAdjustmentInSeconds = 0.0
        
        for component in timeAdjustment.components(separatedBy: ", ") {
            let trimmedComponent = component.trimmingCharacters(in: .whitespaces)
            
            if trimmedComponent.contains("hour") {
                let hourParts = trimmedComponent.components(separatedBy: " ")
                if let value = Int(hourParts[0]) {
                    timeAdjustmentInSeconds += Double(value * 3600)
                }
            } else if trimmedComponent.contains("minute") {
                let minuteParts = trimmedComponent.components(separatedBy: " ")
                if let value = Int(minuteParts[0]) {
                    timeAdjustmentInSeconds += Double(value * 60)
                }
            }
        }
        return timeAdjustmentInSeconds
    }
    
    public static func addIntervalAndFormat(seconds: TimeInterval) -> (day: String, hour: String, minute: String, ampm: String) {
        let currentDate = Date()
        let adjustedDate = currentDate.addingTimeInterval(seconds)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")

        dateFormatter.dateFormat = "MMM dd"
        let dayString = dateFormatter.string(from: adjustedDate)
        
        dateFormatter.dateFormat = "h"
        let hourString = dateFormatter.string(from: adjustedDate)
        
        dateFormatter.dateFormat = "mm"
        let minuteString = dateFormatter.string(from: adjustedDate)
        
        dateFormatter.dateFormat = "a"
        let ampmString = dateFormatter.string(from: adjustedDate)
        
        return (dayString, hourString, minuteString, ampmString)
    }
}
