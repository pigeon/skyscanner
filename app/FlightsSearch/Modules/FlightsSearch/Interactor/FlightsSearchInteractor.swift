//
//  MoviesListInteractor.swift
//  Movies
//
//  Created by Dmytro Golub on 09/04/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

import Foundation
import UIKit


struct FlightDetais {
    let carrierLogoURL:String
    let departureTime:Date
    let arrivalTime:Date
    let carrier:String
    let originStation:String
    let destinationStation:String
    let flightTime:String
}

struct FlightSearchResult {
    let outbountFlight:FlightDetais
    let inboundFlight:FlightDetais
    let rating:Double
    let price:Double
}

class FlightsSearchInteractor: FlightsSearchInteractorInput {

    weak var output: FlightsSearchInteractorOutput!
    let flightSearchService:FlightSearchService
    
    var numberOfPages = 0
    var currentPage = 0
    
    lazy var dateFormatterFrom:DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()

    lazy var dateFormatterTo:DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter
    }()
    
    init(service:FlightSearchService = FlightSearchServiceImpl()) {
        flightSearchService = service
    }
    
    func formatDate(_ date:String?) -> String? {
        
        guard let date = date else {
            return nil
        }

        if let d = dateFormatterFrom.date(from: date){
            return dateFormatterTo.string(from: d)
        }
        return date
    }
    
    
    
    func movieImageURL(id:String?) -> String? {
        guard let id = id else {
            return nil
        }
        return "http://image.tmdb.org/t/p/w500/\(id)"
    }
    
    func getMovies() {
        flightSearchService.findFlights(from: "LOND", to: "EDI") { object,error in
            print(object)
        }
//        flightSearchService.movies(page: currentPage + 1) { [weak self] res,error  in
//            if let res = res,
//                let results = res.results {
//                self?.currentPage = res.page!
//                self?.numberOfPages = res.total_pages!
//                var resultedMovies:[Movie] = []
//                results.forEach {
//                    let movie = Movie(url: self?.movieImageURL(id:$0.poster_path),
//                                      title: $0.title,
//                                      overview: $0.overview,
//                                      vote: self?.formatVotes(rating:$0.vote_average),
//                                      date: self?.formatDate($0.release_date))
//                    if let movie = movie {
//                        resultedMovies.append(movie)
//                    }
//                }
//                DispatchQueue.main.async {
//                    self?.output.movies( resultedMovies )
//                }
//            } else {
//                self?.output.error(error!)
//            }
//        }
    }
    
}
