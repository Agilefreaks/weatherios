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

    func testReverseGeocodeToCityName() throws {
        let sut = LocationViewModel()
        let sibiuLocation = CLLocation(latitude: 45.79781812434426, longitude: 24.14944932344487)
        
        sut.getCityName(for: sibiuLocation) { placemark in
            sut.city = placemark?.first?.locality ?? ""
            XCTAssertTrue(sut.city == "Sibiu")
        }
    }


}
