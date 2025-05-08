//
//  CGMScreens.swift
//  LoopUITestingKit
//
//  Created by Petr Žywczok on 06.01.2025.
//

import XCTest

public final class CGMScreens: BaseScreen {
    
    // MARK: Elements
    
    private var actionSheetCgmSimulatorButton: XCUIElement {
        app.buttons["CGM Simulator"]
    }
    // MARK: Actions
    
    public func tapActionSheetCgmSimulatorButton() { actionSheetCgmSimulatorButton.safeTap() }
}
