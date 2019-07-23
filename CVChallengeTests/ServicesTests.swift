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
    
    func test_inject_url(){
        
        let expectation = self.expectation(description: "Inject URL Expectation")
        
        mockApiClient.personalDataServiceURL(urlString: "https://gist.github.com/PabloRb2X/58eabff8ec5d7eb766f58d473ff12a7b/raw") { (personalData, error) in
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
    
    func test_inject_session(){
        
        let expectation = self.expectation(description: "Inject Session Expectation")
        
        mockApiClient.personalDataServiceSession(urlString: "https://gist.github.com/PabloRb2X/58eabff8ec5d7eb766f58d473ff12a7b/raw") { (personalData, error) in
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
