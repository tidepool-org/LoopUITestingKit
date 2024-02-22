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
    public struct TestSettings {
        public static let appName: String = ProcessInfo.processInfo.environment["appName"]!
        public static let bundleIdentifier: String = ProcessInfo.processInfo.environment["bundleIdentifier"]!
        public static let elementTimeout: TimeInterval = 5
    }
    
    public init() {}
}

public func waitForExistence(
    _ element: XCUIElement,
    timeout: TimeInterval = Common.TestSettings.elementTimeout,
    file: StaticString = #filePath,
    line: UInt = #line
) {
    XCTAssert(
        element.waitForExistence(timeout: timeout),
        file: file,
        line: line
    )
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
