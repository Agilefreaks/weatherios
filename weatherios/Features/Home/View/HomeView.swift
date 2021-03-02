//
//  ContentView.swift
//  weatherios
//
//  Created by Vlad Stanescu on 08.12.2020.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var locationViewModel = LocationViewModel()
    
    @State var isShowingSearchView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                CurrentWeatherCardView(locationViewModel: locationViewModel)
                NavigationLink(
                    destination: SearchView(locationViewModel: locationViewModel, isShowingSearchView: $isShowingSearchView),
                    isActive: $isShowingSearchView) {
                    EmptyView()
                }
                Spacer()
                Button(action: {
                    isShowingSearchView.toggle()
                }, label: {
                    Text("Select City")
                        .font(.system(size: 28))
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(8)
                })
                Spacer()
            }
        }
    }
}

