//
//  GreenTechUITests.swift
//  GreenTechUITests
//
//  Created by Shivani Murali on 9/26/16.
//  Copyright © 2016 Shivani Murali. All rights reserved.
//

import XCTest

class GreenTechUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMapTab() {
        let app = XCUIApplication()
        app.navigationBars["GreenTech.View"].buttons[">>"].tap()
        app.tables.staticTexts["Maps"].tap()
    }
    
    func testEducationalTab() {
        let app = XCUIApplication()
        app.navigationBars["GreenTech.View"].buttons[">>"].tap()
        app.tables.staticTexts["Educational"].tap()
    }
    
    func testSearchTab() {
        let app = XCUIApplication()
        app.navigationBars["GreenTech.View"].buttons[">>"].tap()
        app.tables.staticTexts["Search"].tap()
    }
    
    func testUploadTab() {
        
        let app = XCUIApplication()
        app.navigationBars["GreenTech.View"].buttons[">>"].tap()
        app.tables.staticTexts["Upload"].tap()
        
    }
    
    func testAddEntry() {
        
        
        
        let app = XCUIApplication()
        app.navigationBars["GreenTech.View"].buttons[">>"].tap()
        app.tables.staticTexts["Maps"].tap()
        app.pressForDuration(3.0)
        
        
        
       
        
    }
}
