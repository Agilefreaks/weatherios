//
//  ContentView.swift
//  weatherios
//
//  Created by Vlad Stanescu on 08.12.2020.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var locationViewModel = LocationViewModel()
    
    @State var isButtonClicked: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text(locationViewModel.city)
                        .font(.system(size: 52))
                        .accessibility(identifier: TestIdentifiers.textCity.rawValue)
                    CurrentWeatherCardView(locationViewModel: locationViewModel)
                }
                .padding(.top)
                .padding()
                NavigationLink(
                    destination: SearchView(),
                    isActive: $isButtonClicked) {
                    EmptyView()
                }
                Button(action: {
                    isButtonClicked.toggle()
                }, label: {
                    Text("Select City")
                })
                Spacer()
                VStack {
                    Text("Coordinates:")
                        .padding()
                    Text("Lat: \(locationViewModel.latitude)")
                    Text("Long: \(locationViewModel.longitude)")
                }
                .padding()
                .padding(.bottom)
                
            }
        }
        
    }
}

