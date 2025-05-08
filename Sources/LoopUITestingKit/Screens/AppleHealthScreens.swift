//
//  AppleHealthScreens.swift
//  LoopUITestingKit
//
//  Created by Scott Foster on 5/9/25.
//

import XCTest

public final class AppleHealthScreens: BaseScreen {
    
    // MARK: Elements
        
    private var healthContinueButton: XCUIElement { app.buttons.containing(NSPredicate(format: "identifier CONTAINS 'ContinueButton'")).firstMatch }
    private var showHealthDataCell: XCUIElement { app.cells["UIA.Health.ShowAllHealthData"]}
    private var healthSummaryHeader: XCUIElement { app.staticTexts.containing(NSPredicate(format: "label CONTAINS 'Summary'")).firstMatch }
    private var bloodGlucoseDataTypeText: XCUIElement { app.staticTexts.containing(NSPredicate(format: "identifier CONTAINS 'TypeIdentifierBloodGlucose'")).firstMatch }
    private var unitOptionCell: XCUIElement { app.cells.containing(NSPredicate(format: "label CONTAINS 'Unit'")).firstMatch }
    private var mgPerDeciliterUnitCell: XCUIElement { app.cells.containing(NSPredicate(format: "label CONTAINS 'mg/dL'")).firstMatch }
    private var mmolPerLitreUnitCell: XCUIElement { app.cells.containing(NSPredicate(format: "label CONTAINS 'mmol/L'")).firstMatch }
    
    
    // MARK: Actions
    
    public func tapOnboardingContinueButton() { healthContinueButton.safeTap() }
    public func tapShowHealthDataCell() { showHealthDataCell.safeTap() }
    public func tapBloodGlucoseDataTypeText() { bloodGlucoseDataTypeText.safeTap() }
    public func tapMgPerDeciliterUnitCell() { mgPerDeciliterUnitCell.safeTap() }
    public func tapMmolPerLitreUnitCell() { mmolPerLitreUnitCell.safeTap() }
    public func tapUnitOptionCell() {
        app.swipeToElement(element: unitOptionCell, swipeDirection: SwipeDirection.up, swipeVelocity: .fast)
        unitOptionCell.safeTap()
    }
    
    // MARK: Verifications
    
    
    public var onboardingContinueButtonExists: Bool { healthContinueButton.safeExists }
    public var healthSummaryHeaderExists: Bool { healthSummaryHeader.safeExists }
    public var mgPerDeciliterUnitCallisSelected: Bool { mgPerDeciliterUnitCell.safeIsSeleceted() }
    public var mmolPerLitreUnitCallisSelected: Bool { mmolPerLitreUnitCell.safeIsSeleceted() }
    
    
}
