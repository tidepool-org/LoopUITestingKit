//
//  NavigationBar.swift
//  LoopUITestingKit
//
//  Created by Petr Žywczok on 11.03.2025.
//

import XCTest

public final class NavigationBar: BaseScreen {
    
    // MARK: Elements
    
    private var backButton: XCUIElement { app.navigationBars.buttons.element(boundBy: 0) }
    private var saveButton: XCUIElement { app.buttons["button_Save"] }
    private var doneButton: XCUIElement { app.buttons["button_done"] }
    
    // MARK: Actions
    
    public var getSaveButtonValue: String { saveButton.getValueSafe() }
    
    public func tapBackButton() { backButton.safeTap() }
    public func tapSaveButton() { saveButton.safeTap() }
    public func tapDoneButton() { doneButton.safeTap() }
    
    // MARK: Verifications
    
    public var backButtonExists: Bool { backButton.safeExists }
    public var saveButtonExists: Bool { saveButton.safeExists }
}
