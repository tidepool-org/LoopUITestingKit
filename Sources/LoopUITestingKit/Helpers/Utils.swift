//
//  Untitled.swift
//  TidepoolSupport
//
//  Created by Petr Žywczok on 14.11.2024.
//
import XCTest

enum SwipeDirection {
    case up
    case down
    case left
    case right
}

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
    
    func safePressWithDurationAtPosition(tapPosition: CGPoint, duration: TimeInterval = 3) {
        func pressWithDurationAtPosition(position: CGPoint) {
            let coordinate = self.coordinate(withNormalizedOffset: CGVector.zero)
                .withOffset(CGVector(dx: position.x, dy: position.y))
            coordinate.press(forDuration: duration)
        }
        
        safe {
            pressWithDurationAtPosition(position: tapPosition)
        }
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
    public func uninstall(appName: String) {
        self.terminate()
        
        let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
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
        sleep(10)
    }
    
    func swipeToElement(
        element: XCUIElement,
        swipeDirection: SwipeDirection,
        swipeVelocity: XCUIGestureVelocity = .default
    ) {
        var maxAttempts = 4
        
        while !element.isHittable {
            if maxAttempts == 0 { break }
            switch swipeDirection {
            case .up: swipeUp(velocity: swipeVelocity)
            case .down: swipeDown(velocity: swipeVelocity)
            case .left: swipeLeft(velocity: swipeVelocity)
            case .right: swipeRight(velocity: swipeVelocity)
            }
            maxAttempts -= 1
        }
    }
}
