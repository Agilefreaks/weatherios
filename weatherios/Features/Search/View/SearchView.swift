//
//  SearchView.swift
//  weatherios
//
//  Created by Vlad Stanescu on 10.12.2020.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var locationService = LocationSearchService()
    @ObservedObject var locationViewModel: LocationViewModel
    @Binding var isButtonClicked: Bool
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search city", text: $locationService.queryFragment)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(8)
            .padding()
            
            List {
                ForEach(locationService.searchResults, id: \.self) { result in
                    Text(result.title)
                        .padding(.vertical)
                        .onTapGesture {
                            let resultData = result.title.components(separatedBy: ",")
                            let cityTitle = resultData.first
                            let cityCountryCode = Locale(identifier: "en_US_POSIX").isoCode(for: resultData.last!)
                            
                            self.locationViewModel.fetchCurrentWeather(cityName: cityTitle, country: cityCountryCode ?? "") { result in
                                self.locationViewModel.weather = result
                                self.locationViewModel.city = cityTitle ?? ""
                            }
                            self.isButtonClicked = false
                        }
                }
            }
        }
        .navigationBarTitle("Search City", displayMode: .inline)
    }
}
