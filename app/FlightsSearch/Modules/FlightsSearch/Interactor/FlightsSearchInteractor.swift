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
    
    
    lazy var dateFormatterFrom:DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter
    }()

    lazy var dateFormatterTo:DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter
    }()
    
    init(service:FlightSearchService = FlightsSearchServiceMock() /*FlightSearchServiceImpl()*/) {
        flightSearchService = service
    }
    
    func formatFlightTime(_ date:String?) -> String? {
        
        guard let date = date, let flightDate = self.dateFormatterFrom.date(from:date) else {
            return nil
        }
        
        return self.dateFormatterTo.string(from: flightDate)
    }
    
    func carriers(with ids:[Int]?,searchResults:FlightSearchResults) -> String {
        var resultedString = ""
        ids?.forEach {
            let carrierID = $0
            if let carrier = searchResults.carriers?.index(where: { $0.id == carrierID }) {
                resultedString += (searchResults.carriers?[carrier].name)!
            }
        }
        return resultedString
    }

    func carrierURL(with id:Int,searchResults:FlightSearchResults) -> String {
            if let carrier = searchResults.carriers?.index(where: { $0.id == id }) {
                return (searchResults.carriers?[carrier].imageUrl)!
            }
        return ""
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
                
                let carriersString = self.carriers(with: outboundDetails.carriers,searchResults: results)
                let carrierURL = self.carrierURL(with: (outboundDetails.carriers?.first)!,searchResults: results)
                
                outboundFlight = FlightDetais(carrierLogoURL: carrierURL, departureTime: formatFlightTime(outboundDetails.departure)! , arrivalTime: formatFlightTime(outboundDetails.arrival)!, carrier: carriersString, originStation: /*outboundDetails.originStation*/ "London", destinationStation: /*outboundDetails.destinationStation*/"Edinburgh", flightTime:  String(outboundDetails.duration!) )
            }
            
            if let inboundDetails = inbound?.first {
                //TODO: change to the function
                let carriersString = self.carriers(with: inboundDetails.carriers,searchResults: results)
                let carrierURL = self.carrierURL(with: (inboundDetails.carriers?.first)!,searchResults: results)
                inboundFlight = FlightDetais(carrierLogoURL: carrierURL, departureTime: formatFlightTime(inboundDetails.departure)! , arrivalTime: formatFlightTime(inboundDetails.arrival)!, carrier: carriersString, originStation: /*inboundDetails.originStation*/ "London", destinationStation: /*inboundDetails.destinationStation*/"Edinburgh", flightTime:  String(inboundDetails.duration!) )
            }
            
            let booking = BookingDetails(outbountFlight: outboundFlight!, inboundFlight: inboundFlight!, rating: 5, price: 123)
            resultedArray.append(booking)
        }
        return resultedArray
    }
    
    
}
