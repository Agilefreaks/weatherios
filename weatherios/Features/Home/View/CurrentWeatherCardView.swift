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
                Text(locationViewModel.title)
                    .font(.title2)
                    .foregroundColor(Color(UIColor.darkGray))
                    .padding(.bottom)
                Image(systemName: locationViewModel.weatherIconName)
                    .font(.system(size: 60))
                    .padding(.bottom)
                Text(locationViewModel.actualTemperature)
                    .font(.system(size: 24))
            }
            .padding()
            HStack {
                Text(locationViewModel.visibility)
                Text(locationViewModel.humidity)
            }
        }
    }
}


