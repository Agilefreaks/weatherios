//
//  SearchView.swift
//  weatherios
//
//  Created by Vlad Stanescu on 10.12.2020.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var locationService = LocationService()
    @Binding var isButtonClicked: Bool
    
    @Binding var selectedCityData: [String]
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search city", text: $locationService.queryFragment)
//                Button(action: {
//                    isButtonClicked.toggle()
//                }, label: {
//                    Text("Select City")
//                })
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
                            print(result.title.split(separator: ","))
                            let resultData = result.title.components(separatedBy: ",")
                            self.selectedCityData = resultData
                            self.isButtonClicked = false
                        }
                }
            }
        }
        .navigationBarTitle("Search City", displayMode: .inline)
    }
}
