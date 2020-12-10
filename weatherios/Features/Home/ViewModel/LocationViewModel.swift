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
    @Published var weather = Weather()
    
    var country: String = ""
    
    var title: String {
        return weather.summary?.title ?? "No Summary data"
    }
    
    var weatherIconID: String {
        return weather.summary?.icon ?? ""
    }
    
    var weatherIconName: String {
        switch weatherIconID {
        case "01d":
            return "sun.max"
        case "02d":
            return "cloud.sun"
        case "03d", "03n", "04d", "04n":
            return "cloud"
        case "09d":
            return "cloud.heavyrain"
        case "10d":
            return "cloud.rain"
        case "11d":
            return "cloud.bolt"
        case "13d":
            return "snow"
        case "50d":
            return "cloud.fog"
        default:
            return "sun.max"
        }
    }
    
    var actualTemperature: String {
        let temperature = weather.temperature?.actual ?? 0
        return String(format: "%.2f °C", temperature)
    }
    
    var visibility: String {
        let cloudsVisibility = weather.clouds?.visibility ?? 0
        let formattedVisibility = String(format: "%d%%", cloudsVisibility / 100)
        return "Visibility: " + formattedVisibility
    }
    
    var humidity: String {
        let cloudsHumidity = weather.clouds?.humidity ?? 0
        let formattedHumidity = String(format: "%d%%", cloudsHumidity)
        return String("Humidity: \(formattedHumidity)")
    }
    
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
            
            self.fetchCurrentWeather(cityName: self.city, country: self.country) { (weatherData) in            
                self.weather = weatherData
            }
        }
    }
    
    func getCityData(for location: CLLocation, completion: @escaping (CLPlacemark) -> ()) {
        geocoder.reverseGeocodeLocation(location) { (placemark, _) in
            guard let cityData = placemark?.first  else { return }
            completion(cityData)
        }
    }
    
    func fetchCurrentWeather(cityName: String!, country: String, completion: @escaping (Weather) -> Void) {
        Network.shared.getCityByName(name: cityName, country: country) { result in
            switch result {
            case .success(let graphQLResult):
                if let weatherData = graphQLResult.weather {
                    completion(weatherData)
                }
            case .failure(let error ):
                print(error)
            }
        }
        }
    }
    

