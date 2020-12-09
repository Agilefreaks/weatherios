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
    @Published var country: String = ""
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
        
        getCityData(for: location) { cityData in
            self.city = cityData.locality ?? ""
            self.country = cityData.isoCountryCode ?? ""
            
        }
        
        fetchCurrentWeather(cityName: self.city, country: self.country) { (weatherData) in
            self.weather = weatherData
        }
        
    }
    
    func getCityData(for location: CLLocation, completion: @escaping (CLPlacemark) -> ()) {
        geocoder.reverseGeocodeLocation(location) { (placemark, _) in
            guard let cityData = placemark?.first  else { return }
            completion(cityData)
            
        }
    }
    
    func fetchCurrentWeather(cityName: String!, country: String, completion: @escaping (CurrentWeatherQuery.Data.GetCityByName.Weather) -> Void) {
        Network.shared.apollo.fetch(query: CurrentWeatherQuery(name: cityName, country: country)) { result in
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
