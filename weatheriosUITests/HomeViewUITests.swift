//
//  weatheriosUITests.swift
//  weatheriosUITests
//
//  Created by Vlad Stanescu on 08.12.2020.
//

import XCTest

class HomeViewUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    
    func testHomeIsDisplayed() throws {
        let textCity = app.staticTexts[TestIdentifiers.textCity.rawValue]
        XCTAssert(textCity.waitForExistence(timeout: 10))
        XCTAssert(textCity.exists)
        
        let textWeatherSummary = app.staticTexts[TestIdentifiers.textWeatherSummary.rawValue]
        XCTAssert(textWeatherSummary.waitForExistence(timeout: 10))
        XCTAssert(textWeatherSummary.exists)
        
        let imageWeather = app.images[TestIdentifiers.imageWeather.rawValue]
        XCTAssert(imageWeather.waitForExistence(timeout: 10))
        XCTAssert(imageWeather.exists)
        
        let textWeatherTemperature = app.staticTexts[TestIdentifiers.textWeatherTemperature.rawValue]
        XCTAssert(textWeatherTemperature.waitForExistence(timeout: 10))
        XCTAssert(textWeatherTemperature.exists)
        
        let textWeatherVisibility = app.staticTexts[TestIdentifiers.textWeatherVisibility.rawValue]
        XCTAssert(textWeatherVisibility.waitForExistence(timeout: 10))
        XCTAssert(textWeatherVisibility.exists)
        
        let textWeatherHumidity = app.staticTexts[TestIdentifiers.textWeatherHumidity.rawValue]
        XCTAssert(textWeatherHumidity.waitForExistence(timeout: 10))
        XCTAssert(textWeatherHumidity.exists)
    }
}
