//
//  LocationModel.swift
//  weatherios
//
//  Created by Vlad Stanescu on 08.12.2020.
//

import Foundation
import CoreLocation

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    
    @Published var latitude: Double = 0
    @Published var longitude: Double = 0
    @Published var city: String = ""
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
      }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        latitude = location.coordinate.latitude
        longitude = location.coordinate.longitude
    
        getCityName(for: location) { placemark in
            self.city = placemark?.first?.locality ?? ""
        }
    }
    
    func getCityName(for location: CLLocation, completion: @escaping ([CLPlacemark]?) -> ()) {
        geocoder.reverseGeocodeLocation(location) { (placemark, _) in
            completion(placemark)
        }
    }
    
}
