//
//  ActiveCarbsScreen.swift
//  LoopUITestingKit
//
//  Created by Petr Žywczok on 27.03.2025.
//

import XCTest

public final class ActiveCarbsScreen: BaseScreen {
    
    // MARK: Elements
    
    private var carbEntryCells: XCUIElementQuery {
        app.descendants(matching: .any).matching(NSPredicate(format: "identifier == 'cell_CarbEntry'"))
    }
    
    // MARK: Actions
    
    public func getCarbEntryCellValues(cellIndex: Int) -> [String: String] {
        let cellValuesKeys = ["ConsumeTime", "CarbsAbsorbed", "TimeOfAbsorbtion", "CarbsAmountType"]
        var cellValuesMap: [String: String] = [:]
        
        for (valueIndex, cellValuesKey) in cellValuesKeys.enumerated() {
            cellValuesMap[cellValuesKey] = carbEntryCells.element(boundBy: cellIndex).staticTexts.element(boundBy: valueIndex).label
        }
        return cellValuesMap
    }
    
    public func tapCarbEntryCell(cellIndex: Int) { carbEntryCells.element(boundBy: cellIndex).safeTap() }
}
