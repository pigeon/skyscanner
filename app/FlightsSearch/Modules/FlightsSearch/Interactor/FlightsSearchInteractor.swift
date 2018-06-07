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
    let departureTime:String
    let arrivalTime:String
    let carrier:String
    let originStation:String
    let destinationStation:String
    let flightTime:String
}

struct BookingDetails {
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
    
    init(service:FlightSearchService = FlightsSearchServiceMock() /*FlightSearchServiceImpl()*/) {
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
    
    func findFlights() {
        flightSearchService.findFlights(from: "LOND", to: "EDI") { [weak self] object,error in
            if let object = object {
                let res = self?.populate(with: object)
                self?.output.flights(res!)
            } else if let error = error{
                self?.output.error(error)
            }
        }
    }
    
    func populate(with results:FlightSearchResults) -> [BookingDetails] {
        var resultedArray = [BookingDetails]()
        
        results.itineraries?.forEach {
            let outboundLegId = $0.outboundLegId
            let inboundLegId = $0.inboundLegId
            let outbound = results.legs?.filter { $0.id == outboundLegId}
            let inbound = results.legs?.filter {  $0.id == inboundLegId }
            
            var outboundFlight:FlightDetais?
            var inboundFlight:FlightDetais?
            
            if let outboundDetails = outbound?.first {
                //TODO: change to the function
                outboundFlight = FlightDetais(carrierLogoURL: "", departureTime: outboundDetails.departure! , arrivalTime: outboundDetails.arrival!, carrier: "", originStation: /*outboundDetails.originStation*/ "London", destinationStation: /*outboundDetails.destinationStation*/"Edinburgh", flightTime:  String(outboundDetails.duration!) )
            }
            
            if let inboundDetails = inbound?.first {
                //TODO: change to the function
                inboundFlight = FlightDetais(carrierLogoURL: "", departureTime: inboundDetails.departure! , arrivalTime: inboundDetails.arrival!, carrier: "", originStation: /*inboundDetails.originStation*/ "London", destinationStation: /*inboundDetails.destinationStation*/"Edinburgh", flightTime:  String(inboundDetails.duration!) )
            }
            
            let booking = BookingDetails(outbountFlight: outboundFlight!, inboundFlight: inboundFlight!, rating: 5, price: 123)
            resultedArray.append(booking)
        }
        return resultedArray
    }
    
    
}
