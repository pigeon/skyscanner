//
//  FlightDetails.swift
//  FlightsSearch
//
//  Created by Dmytro Golub on 06/06/2018.
//  Copyright © 2018 Paysafe. All rights reserved.
//

import UIKit
import Kingfisher

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
        self.departureAndArrivalTime.text = "\(details.departureTime) - \(details.arrivalTime)"
        self.directFlight.text = "Direct"
        self.destinationCarrier.text = details.carrier
        self.flightTime.text = "\(details.flightTime)"
    }
}
