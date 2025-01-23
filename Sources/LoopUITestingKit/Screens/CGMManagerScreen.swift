//
//  CGMManagerScreen.swift
//  TidepoolSupport
//
//  Created by Petr Žywczok on 21.11.2024.
//

import XCTest

public final class CGMManagerScreen: BaseScreen {
    
    // MARK: Elements
    
    private var cgmSimulatorTitle: XCUIElement { app.navigationBars.staticTexts["CGM Simulator"] }
    private var cgmSimulatorDoneButton: XCUIElement { app.navigationBars["CGM Simulator"].buttons["Done"] }
    
    // MARK: Actions
    
    public var cgmSimulatorDisplayed: Bool { cgmSimulatorTitle.safeExists }

    public func tapCgmSimulatorDoneButton() { cgmSimulatorDoneButton.safeTap() }
}
