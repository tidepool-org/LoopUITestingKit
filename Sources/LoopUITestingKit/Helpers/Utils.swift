//
//  Untitled.swift
//  TidepoolSupport
//
//  Created by Petr Žywczok on 14.11.2024.
//
import XCTest

extension XCUIElement {
    func safeTap() {
        safe {
            tap()
        }
    }
    
    func tapIfExists(timeout: Double) -> Bool {
        let exists = waitForExistence(timeout: timeout)
        if exists {
            tap()
        }
        return exists
    }
    
    var safeExists: Bool {
        waitForExistence(timeout: Double(5))
    }

    func safe(action: () -> Void) {
        if safeExists {
            action()
        } else {
            XCTFail("Element \(self) does not exist!")
        }
    }
    
    func getValueSafe() -> String {
        if !safeExists {
            XCTFail("Element \(self) does not exist!")
        }
        return value as! String
    }
    
    func getLableSafe() -> String {
        if !safeExists {
            XCTFail("Element \(self) does not exist!")
        }
        return label
    }
    
    func safeIsEnabled() -> Bool {
        if !safeExists {
            XCTFail("Element \(self) does not exist!")
        }
        return isEnabled
    }
    
    func safeForceTap() {
        safe {
            if isHittable {
                tap()
            }
            else {
                let coordinate: XCUICoordinate = coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0))
                coordinate.tap()
            }
        }
    }
}

extension XCUIApplication {
    public func uninstall(name: String? = "Tidepool Loop") {
        self.terminate()
        
        let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
        let appName: String
        if let name = name {
            appName = name
        } else {
            let uiTestRunnerName = Bundle.main.infoDictionary?["CFBundleName"] as! String
            appName = uiTestRunnerName.replacingOccurrences(of: "UITests-Runner", with: "")
        }
        
        let appIcon = springboard.icons[appName].firstMatch
        let removeAppButton = springboard.buttons["Remove App"]
        let deleteAppButton = springboard.alerts.buttons["Delete App"]
        let finalDeleteButton = springboard.alerts.buttons["Delete"]
        
        if appIcon.safeExists {
            if !appIcon.isHittable {
                XCUIDevice.shared.press(XCUIDevice.Button.home)
                springboard.swipeLeft(velocity: .slow)
            }
            appIcon.press(forDuration: 1)
            if removeAppButton.safeExists { removeAppButton.safeTap() } else {
                appIcon.press(forDuration: 1.5)
            }
            deleteAppButton.safeTap()
            finalDeleteButton.safeTap()
        }
    }
}
