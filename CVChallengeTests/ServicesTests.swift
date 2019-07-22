//
//  ServicesTests.swift
//  CVChallengeTests
//
//  Created by Pablo Ramirez on 7/9/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import XCTest

class ServicesTests: XCTestCase {

    private var mockApiClient = MockApiClient()
    
    override func setUp() {
        
        super.setUp()    }

    func test_get_personalData(){
        let expectation = self.expectation(description: "Personal Data Expectation")
        
        mockApiClient.shouldReturnError = false
        
        mockApiClient.personalDataService(urlString: "") { (personalData, error) in
            XCTAssertNil(error)
            
            guard let personalData = personalData else{
                XCTFail()
                return
            }
            
            XCTAssertNotNil(personalData)
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
}
