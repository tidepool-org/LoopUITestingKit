//
//  OnboardingScreen.swift
//
//
//  Created by Cameron Ingham on 2/13/24.
//

import XCTest

open class OnboardingScreen: BaseScreen {
    public func skipAllOfOnboardingIfNeeded() {
        XCTFail("This must be overridden")
    }
    
    public func skipAllOfOnboarding() {
        XCTFail("This must be overridden")
    }
}
