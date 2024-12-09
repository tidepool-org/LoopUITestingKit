//
//  Notifications.swift
//  TidepoolSupport
//
//  Created by Petr Žywczok on 26.11.2024.
//

import XCTest

public final class Notifications: BaseScreen {
    
    // MARK: Elements
    
    private var notification: XCUIElement {
        springBoard
            .descendants(matching: .any)
            .matching(identifier: "NotificationShortLookView")
            .element
    }
    
    // MARK: Verifications
    
    public var getNotificationLabel: String {
        notification.getLableSafe()
    }
}
