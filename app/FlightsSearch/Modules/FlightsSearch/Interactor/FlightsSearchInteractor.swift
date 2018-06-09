//
//ListInteractor.swift
//
//
//  Created by magic on 08/06/2018.
//
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
    let currency:String
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
    
    lazy var dateFormatterFlayingDate:DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // 2018-06-10
        return dateFormatter
    }()
    
    init(service:FlightSearchService = /*FlightsSearchServiceMock()*/ FlightSearchServiceImpl()) {
        flightSearchService = service
    }
    
    func nextMonday(since date:Date) -> Date {
        let dayNumber = Calendar.current.component(.weekday, from:date)
        var dayComponent = DateComponents()
        if dayNumber <= 1 {
            dayComponent.day = 1
        } else {
            dayComponent.day = 9 - dayNumber
        }
        guard let monday = Calendar.current.date(byAdding: dayComponent, to: date) else {
            return Date()
        }
        return monday
    }
    
    func nextDay(after date:Date) -> Date {
        var dayComponent = DateComponents()
        dayComponent.day = 1
        guard let nextDay = Calendar.current.date(byAdding: dayComponent, to: date) else {
            return Date()
        }
        return nextDay
    }
    
    func formatFlightTime(_ date:String?) -> String {
        
        guard let date = date, let flightDate = self.dateFormatterFrom.date(from:date) else {
            return ""
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
    
    func placeName(with id:Int?,searchResults:FlightSearchResults) -> String {
        guard let id = id,
              let place = searchResults.places?.index(where: { $0.id == id }),
              let code = searchResults.places?[place].code else {
            return "unknown"
        }
        
        return code
    }
    
    func flightDuration(minutes:Int?) ->String {
        guard let minutes = minutes else {
            return "unknown"
        }        
        if minutes < 60 {
            return "\(minutes)m"
        }
        if minutes == 60 {
            return "1h"
        }
        let hours = minutes / 60
        let mins = minutes - (hours * 60)
        return mins == 0 ? "\(hours)h" : "\(hours)h \(mins)m"
    }
    

    func bestPrice(for itineraries:Itineraries) -> Double {
        guard let bestOption = itineraries.pricingOptions?.first,
              let price = bestOption.price else {
            return 0.0
        }
        return price
    }
    
    func populateFlight(with leg:Legs,results:FlightSearchResults) -> FlightDetais {
        let carriersString = self.carriers(with: leg.carriers,searchResults: results)
        let carrierURL = self.carrierURL(with: (leg.carriers?.first)!,searchResults: results)
        let origin = placeName(with: leg.originStation, searchResults: results)
        let destination = placeName(with: leg.destinationStation, searchResults: results)
        
        return   FlightDetais(carrierLogoURL: carrierURL,
                                      departureTime: formatFlightTime(leg.departure),
                                      arrivalTime: formatFlightTime(leg.arrival),
                                      carrier: carriersString,
                                      originStation:  origin,
                                      destinationStation: destination,
                                      flightTime:  flightDuration(minutes:leg.duration) )
    }
    
    func findFlights() {
        let outboundDate = self.nextMonday(since: Date())
        let inboundDate = self.nextDay(after: outboundDate)
        
        flightSearchService.findFlights(from: "LOND",
                                        to: "EDI",
                                        outboundDate:self.dateFormatterFlayingDate.string(from: outboundDate),
                                        inboundDate: self.dateFormatterFlayingDate.string(from: inboundDate)) { [weak self] object,error in
            if let object = object {
                let res = self?.populate(with: object)
                self?.output.flights(res!)
            } else if let error = error{
                self?.output.error(error)
            }
        }
    }
    
    func populate(with results:FlightSearchResults) -> [BookingDetails] {
        
        guard let itineraries = results.itineraries else {
            return []
        }
        
        var resultedArray = [BookingDetails]()
    
        let currency = results.query?.currency ?? ""
        
        for itinerary in itineraries {
            guard let outbound = results.legs?.filter({ $0.id == itinerary.outboundLegId}).first,
                  let inbound = results.legs?.filter({  $0.id == itinerary.inboundLegId }).first else {
                continue
            }
            let outboundFlight = populateFlight(with: outbound, results: results)
            let inboundFlight = populateFlight(with: inbound, results: results)
            let booking = BookingDetails(outbountFlight: outboundFlight, inboundFlight: inboundFlight, rating: 5, price: bestPrice(for: itinerary), currency: currency)
            resultedArray.append(booking)
        }
        return resultedArray
    }
    
    
}
