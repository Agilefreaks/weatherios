//
//  CurrentWeatherCardView.swift
//  weatherios
//
//  Created by Vlad Stanescu on 09.12.2020.
//

import SwiftUI

struct CurrentWeatherCardView: View {
    var weatherData: CurrentWeatherQuery.Data.GetCityByName.Weather
    
    var body: some View {
        VStack {
                HStack {
                    Text("\(weatherData.summary?.title ?? "No data")")
                    Text("\(weatherData.temperature?.actual ?? 0, specifier: "%.2f")")
                }
                .padding()
                HStack {
                    Text("Clouds visibility: \(weatherData.clouds?.visibility ?? 0)")
                    Text("Humidity: \(weatherData.clouds?.humidity ?? 0)")
                }
                
            
        }
    }
}


