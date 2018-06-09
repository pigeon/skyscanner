//
//  FlightSearchService.swift
//
//
//  Created by magic on 08/06/2018.
//
//

import Foundation



protocol FlightSearchService {
    func findFlights(from:String, to:String,outboundDate:String,inboundDate:String, completion:@escaping FlightsSearchCompletion)
}


class FlightSearchServiceImpl : FlightSearchService {
    
    private let session = URLSession(configuration: URLSessionConfiguration.default)
    internal let apiKey:String
    
    init(key:String = "ss630745725358065467897349852985") {

        apiKey = key
    }
    

    
    
    func findFlights(from:String, to:String,outboundDate:String,inboundDate:String, completion:@escaping FlightsSearchCompletion) {
        
        createSession(from: from, to: to) { [weak self] url,error in
            guard let url = url else {
                self?.service(error: error, completion: SearchAction(completion: completion))
                return
            }
            self?.pollSearchResult(with: url, completion: completion)
        }
    }

    func createRequestBody() -> [String:String] {
        let body = [
            "cabinclass":"Economy",
            "country":"UK",
            "currency":"GBP",
            "locale":"en-GB",
            "locationSchema":"sky",
            "originplace":"LOND-sky",
            "destinationplace":"EDI-sky",
            "outbounddate":"2018-06-10",
            "inbounddate":"2018-06-11",
            "adults":"1",
            "children":"0",
            "infants":"0",
            "apikey":"\(apiKey)"
        ]
        return body
    }
    
    func createSession(from:String, to:String,completion:@escaping AuthorisationCompletion) {
        let strURL = "http://partners.api.skyscanner.net/apiservices/pricing/v1.0"
        
        let url = URL(string: strURL)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content-type")
        request.addValue("no-cache", forHTTPHeaderField: "cache-control")

        request.encodeParameters(parameters: createRequestBody())
        
        let task = session.dataTask(with: request) {  (data, response, error) in
            
            if error == nil , let response = response as? HTTPURLResponse {
                if let pollURL = response.allHeaderFields["Location"] as? String {
                    completion(pollURL, nil)
                } else {
                    self.service(error: error as NSError?, completion: AuthorisationAction(completion: completion))
                }
            } else {
                completion(nil,error! as NSError)
            }
        }
        
        task.resume()
        
    }
    
    func pollSearchResult(with url:String,completion:@escaping FlightsSearchCompletion) {
        let strURL = "\(url)?apikey=\(apiKey)&pageIndex=0&pageSize=5"
        let url = URL(string: strURL)
        var request = URLRequest(url: url!)
        request.addValue("no-cache", forHTTPHeaderField: "cache-control")
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) {  (data, response, error) in
            
            if let data = data,let response = response as? HTTPURLResponse, response.statusCode == 200  {
                
                let jsonDecoder = JSONDecoder()
                
                let responseModel = try! jsonDecoder.decode(FlightSearchResults.self, from: data)
                
                completion(responseModel,nil)
            } else {
                self.service(error: error as NSError?, completion: SearchAction(completion: completion))
            }
        }
        
        task.resume()
    }
    
    func service(error:NSError?,completion:CompletionAction) {
        if error == nil {

            completion.add(error:NSError(domain: "WebService",
                                code: Int.max-1,
                                userInfo: [NSLocalizedDescriptionKey : "Unknown error"]))
        } else {
            completion.add(error: error!)
        }
        completion.run()
    }
}


