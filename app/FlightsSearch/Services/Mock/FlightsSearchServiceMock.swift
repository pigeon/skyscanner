//
//  FlightsSearchServiceMock.swift
//  FlightsSearch
//
//  Created by Dmytro Golub on 05/06/2018.
//  Copyright © 2018 Paysafe. All rights reserved.
//

import Foundation


class FlightsSearchServiceMock : FlightSearchService {
    
    let jsonData:Data
    
    init() {
        let url = Bundle.main.url(forResource: "results", withExtension: "json")!
        jsonData = try! Data(contentsOf: url)
    }
    
    func findFlights(from: String, to: String, completion: @escaping FlightsSearchCompletion) {
        let jsonDecoder = JSONDecoder()
        let responseModel = try! jsonDecoder.decode(FlightSearchResults.self, from: jsonData)
        completion(responseModel, nil)
    }
    
    
}