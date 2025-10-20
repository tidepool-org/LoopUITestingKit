//
//  InsulinDeliveryScreen.swift
//  LoopUITestingKit
//
//  Created by Petr Žywczok on 09.05.2025.
//

import XCTest

public final class InsulinDeliveryScreen: BaseScreen {
    
    // MARK: Elements
    
    private var automatedScheduledBasalEventCells: XCUIElementQuery {
        app.cells.containing(.image, identifier: "basal-delivery-log")
    }
    private var automatedScheduledBasalEventTexts: XCUIElementQuery {
        automatedScheduledBasalEventCells.staticTexts.matching(
            NSPredicate(format: "label CONTAINS %@", "Basal: ")
        )
    }
    private var automatedBolusEventCells: XCUIElementQuery {
        app.cells.containing(.image, identifier: "autobolus-delivery-log")
    }
    private var automatedBolusEventTexts: XCUIElementQuery {
        automatedBolusEventCells.staticTexts.matching(
            NSPredicate(format: "label CONTAINS %@", "Bolus: ")
        )
    }
    
    private var isnulinDeliveryRows: XCUIElementQuery {
        app.descendants(matching: .any).matching(NSPredicate(format: "label CONTAINS 'Temp Basal'"))
    }
    
    // MARK: Actions
    
    public var getInsulinDeliveryBasalValues: [Double] {
        var insulinDeliveryArray: [Double] = []
        
        if !isnulinDeliveryRows.element(boundBy: 0).safeExists { XCTFail("No Basal Value displays.") }
        for index in 0 ..< isnulinDeliveryRows.count {
            let historyRowArray = isnulinDeliveryRows.element(boundBy: index).label.components(separatedBy: " ")

            insulinDeliveryArray.append(Double(historyRowArray[2])!)
        }
        
        return insulinDeliveryArray
    }
    
    public var getInsulinDeliveryRowsLabel: [String] {
        var insulinDeliveryArray: [String] = []
        
        if !isnulinDeliveryRows.element(boundBy: 0).safeExists { XCTFail("No Basal Value displays.") }
        for index in 0 ..< isnulinDeliveryRows.count {
            insulinDeliveryArray.append(isnulinDeliveryRows.element(boundBy: index).label)
        }
        
        return insulinDeliveryArray
    }
    // MARK: Verifications
    
    public var automatedScheduledBasalEventsExist: Bool {
        automatedScheduledBasalEventCells.element(boundBy: 0).safeExists
    }
    public var autobolusEventsExist: Bool {
        automatedBolusEventCells.element(boundBy: 0).safeExists
    }
    public var automatedScheduledBasalValuesExist: Bool {
        automatedScheduledBasalEventTexts.element(boundBy: 0).safeExists
    }
    public var automatedBolusValuesExist: Bool {
        automatedBolusEventTexts.element(boundBy: 0).safeExists
    }
}
