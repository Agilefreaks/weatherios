//
//  Network.swift
//  weatherios
//
//  Created by Vlad Stanescu on 09.12.2020.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    private let endpoint = "https://graphql-weather-api.herokuapp.com"
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: endpoint)!)
}

