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
        Text("\(locationViewModel.latitude)")
            .padding()
        Text("\(locationViewModel.longitude)")
            .padding()
    }
}
