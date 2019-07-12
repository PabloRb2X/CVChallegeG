//
//  ServicesTests.swift
//  CVChallengeTests
//
//  Created by Pablo Ramirez on 7/9/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import XCTest

class ServicesTests: XCTestCase {

    private var expectation: XCTestExpectation!
    private var serviceManager: ServiceManager = ServiceManager()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        expectation = self.expectation(description: "waitingResponse")
        
        self.errorCatalog()
    }
    
    func testPersonalDataService(){
        serviceManager.onSuccessPersonalDataService = {(_ response: PersonalData) -> Void in
            print(response)
            XCTAssert(true, "Success")
            self.expectation.fulfill()
        }
        
        serviceManager.performPersonalDataService()
        waitForExpectations(timeout: 60, handler: nil)
    }
    
    func testProfessionalExperienceService(){
        serviceManager.onSuccessProfessionalExperienceService = {(_ response: [Job]) -> Void in
            print(response)
            XCTAssert(true, "Success")
            self.expectation.fulfill()
        }
        
        serviceManager.performProfessionalExperienceService()
        waitForExpectations(timeout: 60, handler: nil)
    }
    
    func errorCatalog() {
        serviceManager.onServiceError  = {(_ error: String)  -> Void in
            XCTAssert(false, error)
            self.expectation.fulfill()
        }
    }

}
