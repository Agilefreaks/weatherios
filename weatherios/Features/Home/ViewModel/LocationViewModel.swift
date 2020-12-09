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
    @Published var weather =  CurrentWeatherQuery.Data.GetCityByName.Weather()
    
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
        getCityName(for: location) { cityName in
            self.city = cityName
            
        }
        fetchCurrentWeather { (weatherData) in
            self.weather = weatherData
        }
        
    }
    
    func getCityName(for location: CLLocation, completion: @escaping (String) -> ()) {
        geocoder.reverseGeocodeLocation(location) { (placemark, _) in
            let cityName = placemark?.first?.locality ?? ""
            completion(cityName)
        }
    }
    
    func fetchCurrentWeather(completion: @escaping (CurrentWeatherQuery.Data.GetCityByName.Weather) -> Void) {
        Network.shared.apollo.fetch(query: CurrentWeatherQuery()) { result in
          switch result {
          case .success(let graphQLResult):
            if let weatherData = graphQLResult.data?.getCityByName?.weather {
                completion(weatherData)
            }
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
    
}
