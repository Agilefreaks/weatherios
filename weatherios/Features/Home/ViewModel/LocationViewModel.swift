//
//  LocationModel.swift
//  weatherios
//
//  Created by Vlad Stanescu on 08.12.2020.
//

import Foundation
import CoreLocation

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var latitude: Double = 0
    @Published var longitude: Double = 0
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
      }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locaton = locations.last else { return }
        
        latitude = locaton.coordinate.latitude
        longitude = locaton.coordinate.longitude
    }
}
