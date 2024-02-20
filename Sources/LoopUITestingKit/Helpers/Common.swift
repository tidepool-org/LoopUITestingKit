//
//  Common.swift
//
//
//  Created by Cameron Ingham on 2/13/24.
//

import Foundation
import XCTest

@MainActor
public class Common {
    struct TestSettings {
        static let elementTimeout: TimeInterval = 5
    }
    
    public private(set) lazy var appName: String = ProcessInfo.processInfo.environment["appName"]!
    public private(set) lazy var bundleIdentifier: String = ProcessInfo.processInfo.environment["bundleIdentifier"]!
    
    public init() {}
}

public func waitForExistence(_ element: XCUIElement) {
    XCTAssert(element.waitForExistence(timeout: Common.TestSettings.elementTimeout))
}

extension XCUIElement {
    public func forceTap() {
        if self.isHittable {
            self.tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0))
            coordinate.tap()
        }
    }
}
