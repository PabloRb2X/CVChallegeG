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
        
        XCUIDevice.shared.orientation = .portrait
        
        let app = XCUIApplication()
        
        app.scrollViews.otherElements.buttons["showProfExpButton"].tap()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.tap()
        app.navigationBars["Projects"].buttons["projectBackBarButton"].tap()
        app.navigationBars["Professional Experience"].buttons["profExpBackBarButton"].tap()
    }
    
    func test_showProfExp_Button(){
        
        XCUIDevice.shared.orientation = .portrait
        
        let app = XCUIApplication()
        app.scrollViews.otherElements.buttons["showProfExpButton"].tap()
        app.navigationBars["Professional Experience"].buttons["profExpBackBarButton"].tap()
    }
    
    func test_show_projects_view(){
        
        XCUIDevice.shared.orientation = .portrait
        
        let app = XCUIApplication()
        app.scrollViews.otherElements.buttons["showProfExpButton"].tap()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Functions: Development of videogames for mobile devices and development of iOS applications"]/*[[".cells.staticTexts[\"Functions: Development of videogames for mobile devices and development of iOS applications\"]",".staticTexts[\"Functions: Development of videogames for mobile devices and development of iOS applications\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let projectbackbarbuttonButton = app.navigationBars["Projects"].buttons["projectBackBarButton"]
        projectbackbarbuttonButton.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.tap()
        projectbackbarbuttonButton.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 2).children(matching: .other).element.children(matching: .other).element.tap()
        projectbackbarbuttonButton.tap()
        app.navigationBars["Professional Experience"].buttons["profExpBackBarButton"].tap()
    }
    
    func test_landscape_navigation(){
        
        XCUIDevice.shared.orientation = .landscapeLeft
        
        let app = XCUIApplication()
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.otherElements.containing(.staticText, identifier:"Pablo Ramírez Barrientos").element.swipeRight()
        scrollViewsQuery.otherElements.buttons["showProfExpButton"].tap()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.tap()
        app.navigationBars["Projects"].buttons["projectBackBarButton"].tap()
        app.navigationBars["Professional Experience"].buttons["profExpBackBarButton"].tap()
    }
}


