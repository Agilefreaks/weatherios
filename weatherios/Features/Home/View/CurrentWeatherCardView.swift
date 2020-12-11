//
//  CurrentWeatherCardView.swift
//  weatherios
//
//  Created by Vlad Stanescu on 09.12.2020.
//

import SwiftUI

struct CurrentWeatherCardView: View {
    @ObservedObject var locationViewModel: LocationViewModel
    
    var body: some View {
        VStack {
            VStack {
                Text(locationViewModel.city)
                    .font(.system(size: 52))
                    .accessibility(identifier: TestIdentifiers.textCity.rawValue)
                Text(locationViewModel.title)
                    .font(.title2)
                    .foregroundColor(Color(UIColor.darkGray))
                    .padding(.bottom)
                    .accessibility(identifier: TestIdentifiers.textWeatherSummary.rawValue)
                Image(systemName: locationViewModel.weatherIconName)
                    .font(.system(size: 60))
                    .padding(.bottom)
                    .accessibility(identifier: TestIdentifiers.imageWeather.rawValue)
                Text(locationViewModel.actualTemperature)
                    .font(.system(size: 24))
                    .accessibility(identifier: TestIdentifiers.textWeatherTemperature.rawValue)
            }
            .padding()
            HStack {
                Text(locationViewModel.visibility)
                    .accessibility(identifier: TestIdentifiers.textWeatherVisibility.rawValue)
                Text(locationViewModel.humidity)
                    .accessibility(identifier: TestIdentifiers.textWeatherHumidity.rawValue)
            }
        }
    }
}


