//
//  RecipeFinderUITests.swift
//  RecipeFinderUITests
//
//  Created by Admin on 7/26/22.
//

import XCTest

class RecipeFinderUITests: XCTestCase {

    override func setUpWithError() throws {
    
        continueAfterFailure = false

    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        

        let beefCategory = app.collectionViews.cells.otherElements.containing(.staticText, identifier:"Beef").element
        XCTAssertTrue(beefCategory.exists)
        beefCategory.tap()
        
        let mealName = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Beef stroganoff"]/*[[".cells.staticTexts[\"Beef stroganoff\"]",".staticTexts[\"Beef stroganoff\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(mealName.exists)
        
        mealName.tap()
        
        let nameOfMeal = app/*@START_MENU_TOKEN@*/.staticTexts["Beef stroganoff"]/*[[".cells.staticTexts[\"Beef stroganoff\"]",".staticTexts[\"Beef stroganoff\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(nameOfMeal.exists)
        
        
//        app.textViews.textViews["Heat the olive oil in a non-stick frying pan then add the sliced onion and cook on a medium heat until completely softened, so around 15 mins, adding a little splash of water if they start to stick at all. Crush in the garlic and cook for a 2-3 mins further, then add the butter. Once the butter is foaming a little, add the mushrooms and cook for around 5 mins until completely softened. Season everything well, then tip onto a plate."].tap()
//        //XCTAssertTrue(instructions.exists)
//        app.textViews.te
        
    
        
    
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
