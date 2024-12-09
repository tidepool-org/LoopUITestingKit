//
//  TestHelper.swift
//  TidepoolSupport
//
//  Created by Petr Žywczok on 14.11.2024.
//
import XCTest

class TestHelper {
    static func waitForExistence(
        _ element: XCUIElement,
        timeout: TimeInterval = Double(20),
        assert: Bool = true,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        if assert {
            XCTAssert(
                element.waitForExistence(timeout: timeout),
                file: file,
                line: line
            )
        } else {
            _ = element.waitForExistence(timeout: timeout)
        }
    }
}
