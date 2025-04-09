//
//  Alerts.swift
//  LoopUITestingKit
//
//  Created by Petr Žywczok on 18.03.2025.
//

import XCTest

public final class Alerts: BaseScreen {
    
    // MARK: Elements
    
    private var alertTitle: XCUIElement { app.alerts.firstMatch.staticTexts.element(boundBy: 0) }
    private var alertBody: XCUIElement { app.alerts.firstMatch.staticTexts.element(boundBy: 1) }
    private var alertFirstButton: XCUIElement { app.alerts.firstMatch.buttons.element(boundBy: 0) }
    private var alertSecondButton: XCUIElement { app.alerts.firstMatch.buttons.element(boundBy: 1) }
    
    // MARK: Actions
    
    public var getAlertTitleText: String { alertTitle.getLableSafe() }
    public var getAlertBodyText: String { alertBody.getLableSafe() }
    public var getAlertFirstButtonText: String { alertFirstButton.getLableSafe() }
    public var getAlertSecondButtonText: String { alertSecondButton.getLableSafe() }
    
    public func tapAlertFirstButton() { alertFirstButton.safeTap() }
    public func tapAlertSecondButton() { alertSecondButton.safeTap() }
    public func waitForAlertTitleExists(timeout: Double) { _ = alertTitle.waitForExistence(timeout: timeout) }
}
