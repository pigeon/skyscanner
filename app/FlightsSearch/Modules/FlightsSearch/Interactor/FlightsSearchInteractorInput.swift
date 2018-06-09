//
//  ImagesImagesInteractorInput.swift
//
//
//  Created by magic on 08/06/2018.
//
//

import Foundation

protocol FlightsSearchInteractorInput {
    func findFlights()
    
    var inboundFlightDate:Date {get set}
    var outboundFlightDate:Date {get set}
    var dateFormatterSubtitle:DateFormatter {get set}
}
