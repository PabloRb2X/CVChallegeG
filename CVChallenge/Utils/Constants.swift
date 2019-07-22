//
//  Constants.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/9/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation

enum Constants: String {
    case urlId = "API_URL"
}

enum ApiError: String {
    case genericError
    case httpError
    case exceedError
    case serializingError
    case defaultValue
    
    func getTextError() -> String {
        switch self {
        case .genericError:
            return "\(NSLocalizedString("error_request", comment: ""))"
        case .httpError:
            return "\(NSLocalizedString("error_http", comment: ""))"
        case .exceedError:
            return "\(NSLocalizedString("exceed_error_service", comment: ""))"
        case .serializingError:
            return "\(NSLocalizedString("error_serializing", comment: ""))"
        default:
            return ""
        }
    }
}
