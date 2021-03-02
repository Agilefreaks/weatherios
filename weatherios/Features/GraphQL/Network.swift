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
    
    func getCityByName(name: String, country: String, completion: @escaping (_ response:
                        Result<CurrentWeatherQuery.Data.GetCityByName, Error>) -> Void) -> Cancellable? {
        let currentWeatherQuery = CurrentWeatherQuery(name: name , country: country)
        return self.apollo.fetch(query: currentWeatherQuery) { res in
            switch res {
            case .success(let graphQLResult):
                
              if let cityData = graphQLResult.data?.getCityByName {
                let queryResult = Result<CurrentWeatherQuery.Data.GetCityByName, Error>.success(cityData)
                
                completion(queryResult)
                return
              }
            case .failure(let error):
                let queryResult = Result<CurrentWeatherQuery.Data.GetCityByName, Error>.failure(error)
                completion(queryResult)
                return
            }
        }
    }
}

