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

    func testPrincipalFlow() {
        
        let app = XCUIApplication()
        app.scrollViews.otherElements.buttons["Show professional Experience"].tap()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).staticTexts["Cargo: Programador"].tap()
        app.navigationBars["Projects"].children(matching: .button).element.tap()
        app.navigationBars["Professional Experience"].buttons["Item"].tap()

    }
    
    func testPrincipalFlowSelectCells(){
        
        let app = XCUIApplication()
        app.scrollViews.otherElements.buttons["Ver experiencia profesional"].tap()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.tap()
        
        let collectionViewsQuery2 = collectionViewsQuery
        collectionViewsQuery2/*@START_MENU_TOKEN@*/.staticTexts["Platform videogame (runner type) for iOS devices. It was created with the Cocos-2d library using the Objective-C language."]/*[[".cells.staticTexts[\"Platform videogame (runner type) for iOS devices. It was created with the Cocos-2d library using the Objective-C language.\"]",".staticTexts[\"Platform videogame (runner type) for iOS devices. It was created with the Cocos-2d library using the Objective-C language.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let button = app.navigationBars["Proyectos"].children(matching: .button).element
        button.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.tap()
        button.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 2).children(matching: .other).element.children(matching: .other).element.tap()
        collectionViewsQuery2/*@START_MENU_TOKEN@*/.staticTexts["Application for consultation and procedures on the Afores of the employees of Mexico. Swift was used for its development."]/*[[".cells.staticTexts[\"Application for consultation and procedures on the Afores of the employees of Mexico. Swift was used for its development.\"]",".staticTexts[\"Application for consultation and procedures on the Afores of the employees of Mexico. Swift was used for its development.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        button.tap()
        app.navigationBars["Experiencia Profesional"].buttons["Item"].tap()
    
    }

}
