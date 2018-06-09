//
//ServiceMock.swift
//
//
//  Created by magic on 08/06/2018.
//
//

import Foundation


class FlightsSearchServiceMock : FlightSearchService {
    func findFlights(from: String, to: String, outboundDate: String, inboundDate: String, completion: @escaping FlightsSearchCompletion) {
        let jsonDecoder = JSONDecoder()
        let responseModel = try! jsonDecoder.decode(FlightSearchResults.self, from: jsonData)
        completion(responseModel, nil)
    }
    
    
    let jsonData:Data
    
    init() {
        let url = Bundle.main.url(forResource: "results", withExtension: "json")!
        jsonData = try! Data(contentsOf: url)
    }
    
}
