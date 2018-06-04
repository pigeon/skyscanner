//
//  TwitterSearchService.swift
//  Movies
//
//  Created by Dmytro Golub on 09/04/2018.
//  Copyright © 2018 Paysafe. All rights reserved.
//

import Foundation



protocol MoviesService {
    func movies(page:Int, completion: @escaping MoviesListCompletion)
}


class MoviesServiceImpl : MoviesService {
    
    private let session = URLSession(configuration: URLSessionConfiguration.default)
    internal let apiKey:String
    
    
    init(key:String = "e5a7a90ede668398505588b032cae4c9") {

        apiKey = key
    }
    

    
    
    func movies(page:Int, completion: @escaping MoviesListCompletion) {
        let strURL = "https://api.themoviedb.org/3/movie/popular?api_key=\(self.apiKey)&page=\(page)"
        
        let url = URL(string: strURL)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) {  (data, response, error) in
            
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                                
                let responseModel = try! jsonDecoder.decode(Movies.self, from: data)
                
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


