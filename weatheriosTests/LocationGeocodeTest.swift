//
//  LocationGeocodeTest.swift
//  weatheriosTests
//
//  Created by Vlad Stanescu on 08.12.2020.
//

import XCTest
import CoreLocation
@testable import weatherios

class LocationGeocodeTest: XCTestCase {

    func testReverseGeocodeToCityData() throws {
        let sut = LocationViewModel()
        
        let sibiuLocation = CLLocation(latitude: 45.79781812434426, longitude: 24.14944932344487)
        let expectedCityName = "Sibiu"
        let expectedCountryCode = "RO"
        
        let exp = expectation(description: "Loading City Name")
        
        sut.getCityData(for: sibiuLocation) { cityData in
            sut.city = cityData.locality ?? ""
            sut.country = cityData.isoCountryCode ?? ""
            exp.fulfill()
        }
        waitForExpectations(timeout: 3)
        
        XCTAssertTrue(sut.city == expectedCityName )
        XCTAssertTrue(sut.country == expectedCountryCode )
    }


}
