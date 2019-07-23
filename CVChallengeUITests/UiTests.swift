//
//  UiTests.swift
//  CVChallengeUITests
//
//  Created by Pablo Ramirez on 7/11/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import XCTest

class UiTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false

        XCUIApplication().launch()
    }

    func test_navigation_app() {
        
        let app = XCUIApplication()
        
        app.scrollViews.otherElements.buttons["showProfExpButton"].tap()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).staticTexts["Puesto: Programmer"].tap()
        app.navigationBars["Proyectos"].children(matching: .button).element.tap()
        app.navigationBars["Experiencia Profesional"].children(matching: .button).element.tap()
        
    }
    
    func test_show_projects_view(){
        
        let app = XCUIApplication()
        app.scrollViews.otherElements.buttons["showProfExpButton"].tap()
        
        let profexpcollectionvCollectionView2 = app.collectionViews["profExpCollectionV"]
        let profexpcollectionvCollectionView = profexpcollectionvCollectionView2
        profexpcollectionvCollectionView/*@START_MENU_TOKEN@*/.staticTexts["Anzen Digital"]/*[[".cells.matching(identifier: \"profExpCell\").staticTexts[\"Anzen Digital\"]",".staticTexts[\"Anzen Digital\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let projectbackbarbButton = app.navigationBars["Projects"].buttons["projectBackBarB"]
        projectbackbarbButton.tap()
        profexpcollectionvCollectionView/*@START_MENU_TOKEN@*/.staticTexts["Global HITSS"]/*[[".cells.matching(identifier: \"profExpCell\").staticTexts[\"Global HITSS\"]",".staticTexts[\"Global HITSS\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        projectbackbarbButton.tap()
        profexpcollectionvCollectionView2.children(matching: .cell).matching(identifier: "profExpCell").element(boundBy: 2).children(matching: .other).element.children(matching: .other).element.tap()
        projectbackbarbButton.tap()
        app.navigationBars["Professional Experience"].buttons["profExpBackBarB"].tap()
        
        XCTAssert(true, "complete")
    }
    
    func test_scrolling_elements(){
        
        
        
    }

}


