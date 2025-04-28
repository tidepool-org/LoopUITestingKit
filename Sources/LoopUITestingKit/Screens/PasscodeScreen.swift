//
//  PasscodeScreen.swift
//  LoopUITestingKit
//
//  Created by Scott Foster on 5/6/25.
//
import XCTest

public final class PasscodeScreen: BaseScreen {
    
    // MARK: Elements

    private var passcodeEntry: XCUIElement { springBoard.secureTextFields["Passcode field"] }

    // MARK: Actions
    
    public func setPasscode() {
        passcodeEntry.safeTap()
        passcodeEntry.typeText("1\n")
    }
    
    public func cancelPasscode() {
        passcodeEntry.safeTap()
        passcodeEntry.typeText("\n")
    }

    // MARK: Verifications

    public var passcodeEntryExists: Bool { passcodeEntry.safeExists }

}
