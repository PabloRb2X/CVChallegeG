//
//  ServiceError.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/9/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation

public struct ServiceError {
    
    let httpCode: Int
    let exception: String
    let message: String
    let cveDiagnostic: String
}
