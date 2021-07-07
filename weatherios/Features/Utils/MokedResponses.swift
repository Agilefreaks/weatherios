//
//  LocationViewModelMockData.swift
//  weatheriosTests
//
//  Created by Vlad Stanescu on 10.12.2020.
//

import Foundation

enum ApiStatus: String {
    case success
    case failure
    
    init(status: String?) {
        guard let apiStatus = status  else {
            self = .success
            return
            
        }
        self = ApiStatus(rawValue: apiStatus) ?? .success
    }
}

class MockedResponses {
    let apoloAPI:  Network
    let status: ApiStatus
    
    init(api: Network, status: ApiStatus) {
        self.apoloAPI = api
        self.status = status
    }
    
//    func getMockedResult() -> Result<Any, Error> {
//        switch status {
//        case .success:
//            return Result.success("")
//        default:
//            <#code#>
//        }
//    }
}
