//
//  MockApiClient.swift
//  CVChallenge
//
//  Created by Pablo Ramirez on 7/22/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation
@testable import CVChallenge

class MockApiClient{
    var shouldReturnError = false
    var personalDataWasCalled = false
    
    let personalData: PersonalData = PersonalData(name: "", lastName: "", profile: "", age: 0, description: "", jobs: [Job](), schoolName: "", city: "", telephone: 0, email: "", image: "", backgroundImage: "")
    
    enum MockServiceError: Error{
        case personalData
    }
    
    func reset(){
        shouldReturnError = false
        personalDataWasCalled = false
    }
    
    convenience init(){
        self.init(false)
    }
    
    init(_ shouldReturnError: Bool){
        self.shouldReturnError = shouldReturnError
    }
    
}

extension MockApiClient: ApiClientProtocol{
    
    func personalDataService(urlString: String, completionHandler: @escaping (PersonalData?, ApiError?) -> Void) {
        personalDataWasCalled = true
        
        if shouldReturnError{
            
            completionHandler(nil, .genericError)
        }
        else{
            
            completionHandler(personalData, nil)
        }
    }
}
