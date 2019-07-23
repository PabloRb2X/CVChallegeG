//
//  UITestExtensions.swift
//  CVChallengeUITests
//
//  Created by Pablo Ramirez on 7/23/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import XCTest

extension XCUIElement {
    func forceTapElement() {
        if self.isHittable {
            self.tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0))
            coordinate.tap()
        }
    }
}
