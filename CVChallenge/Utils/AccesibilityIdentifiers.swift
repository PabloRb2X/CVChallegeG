//
//  AccesibilityBarButtonItem.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/23/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation
import UIKit

class AccesibilityBarButtonItem: UIBarButtonItem {
    @IBInspectable var accessibilityEnabled: Bool {
        get {
            return isAccessibilityElement
        }
        set {
            isAccessibilityElement = newValue
        }
    }
    
    @IBInspectable var accessibilityLabelText: String? {
        get {
            return accessibilityLabel
        }
        set {
            accessibilityLabel = newValue
        }
    }
}
