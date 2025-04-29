//
//  InsulinDeliveryScreen.swift
//  LoopUITestingKit
//
//  Created by Petr Žywczok on 09.05.2025.
//

import XCTest

public final class InsulinDeliveryScreen: BaseScreen {
    
    // MARK: Elements
    
    private var isnulinDeliveryRows: XCUIElementQuery {
        app.descendants(matching: .any).matching(NSPredicate(format: "label CONTAINS 'Temp Basal'"))
    }
    
    // MARK: Actions
    
    public var getInsulinDeliveryBasalValues: [Double] {
        var insulinDeliveryArray: [Double] = []
        
        for index in 0 ..< isnulinDeliveryRows.count {
            let historyRowArray = isnulinDeliveryRows.element(boundBy: index).label.components(separatedBy: " ")

            insulinDeliveryArray.append(Double(historyRowArray[2])!)
        }
        
        return insulinDeliveryArray
    }
}
