//
//  PumpScreens.swift
//  LoopUITestingKit
//
//  Created by Petr Žywczok on 06.01.2025.
//

import XCTest

public class PumpScreens: BaseScreen {
    
    //MARK: Elements
    
    private var actionSheetPumpSimulatorButton: XCUIElement {
        app.buttons["Pump Simulator"]
    }
    
    //MARK: Actions
    
    public func tapActionSheetPumpSimulatorButton() { actionSheetPumpSimulatorButton.safeTap() }
}
