//
//  ContentView.swift
//  weatherios
//
//  Created by Vlad Stanescu on 08.12.2020.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var locationViewModel = LocationViewModel()
    
    var body: some View {
        VStack {
            Text("\(locationViewModel.city)")
                .font(.largeTitle)
            CurrentWeatherCardView(weatherData: locationViewModel.weather)
            Divider()
                .background(Color.black)
                .padding(.horizontal, 32)
                .padding(.bottom)
            Text("Coordinates:")
                .padding()
            Text("Lat: \(locationViewModel.latitude)")
            Text("Long: \(locationViewModel.longitude)")
            
        }
    }
}

