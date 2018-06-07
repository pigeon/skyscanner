//
//  FlightDetails.swift
//  FlightsSearch
//
//  Created by Dmytro Golub on 06/06/2018.
//  Copyright © 2018 Paysafe. All rights reserved.
//

import UIKit
import Kingfisher

extension Color {
    struct FlightDetails {
        static var mainTextColor: Color  { return Color(red:0.33, green:0.30, blue:0.39, alpha:1.0) }
        static var secondaryTextColor: Color { return Color(red:0.54, green:0.51, blue:0.58, alpha:0.74) }
    }
}

class FlightDetailsCell : UITableViewCell {
    
    @IBOutlet weak var carrierLogo: UIImageView!
    @IBOutlet weak var departureAndArrivalTime: UILabel!
    @IBOutlet weak var directFlight: UILabel!
    @IBOutlet weak var destinationCarrier: UILabel!
    @IBOutlet weak var flightTime: UILabel!
    
    
    func configureCell(details:FlightDetais) {
        if let url = URL(string:details.carrierLogoURL) {
            self.carrierLogo.kf.setImage(with:url)
        }
        
        self.departureAndArrivalTime.textColor = Color.FlightDetails.mainTextColor
        self.directFlight.textColor = Color.FlightDetails.mainTextColor
        
        self.destinationCarrier.textColor = Color.FlightDetails.secondaryTextColor
        self.flightTime.textColor = Color.FlightDetails.secondaryTextColor
        
        self.departureAndArrivalTime.text = "\(details.departureTime) - \(details.arrivalTime)"
        self.directFlight.text = "Direct"
        self.destinationCarrier.text = "\(details.originStation)-\(details.destinationStation), \(details.carrier)"
        self.flightTime.text = "\(details.flightTime)"
    }
}
