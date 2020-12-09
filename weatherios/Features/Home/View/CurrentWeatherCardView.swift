//
//  CurrentWeatherCardView.swift
//  weatherios
//
//  Created by Vlad Stanescu on 09.12.2020.
//

import SwiftUI

struct CurrentWeatherCardView: View {
    let weatherData: Weather
    
    var title: String {
        return weatherData.summary?.title ?? "No Summary data"
    }
    
    var weatherIconID: String {
        return weatherData.summary?.icon ?? ""
    }
    
    var weatherIconName: String {
        //TODO: Move this
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
        let temperature = weatherData.temperature?.actual ?? 0
        return String(format: "%.2f °C", temperature)
    }
    
    var visibility: Int {
        return weatherData.clouds?.visibility ?? 0
    }
    
    var humidity: Int {
        return weatherData.clouds?.humidity ?? 0
    }
    
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                Image(systemName: weatherIconName)
                Text(actualTemperature)
            }
            .padding()
            HStack {
                Text("Clouds visibility: \(visibility)")
                Text("Humidity: \(humidity)")
            }
        }
    }
}


