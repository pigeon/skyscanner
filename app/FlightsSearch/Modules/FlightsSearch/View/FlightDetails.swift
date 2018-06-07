//
//  FlightDetails.swift
//  FlightsSearch
//
//  Created by Dmytro Golub on 06/06/2018.
//  Copyright © 2018 Paysafe. All rights reserved.
//

import UIKit


class FlightDetailsCell : UITableViewCell {
    
    @IBOutlet weak var carrierLogo: UIImageView!
    @IBOutlet weak var departureAndArrivalTime: UILabel!
    @IBOutlet weak var directFlight: UILabel!
    @IBOutlet weak var destinationCarrier: UILabel!
    @IBOutlet weak var flightTime: UILabel!
    
    
    func configureCell(details:FlightDetais) {
        self.carrierLogo.image = UIImage(named: "ez")
        self.departureAndArrivalTime.text = "\(details.departureTime) - \(details.arrivalTime)"
        self.directFlight.text = "Direct"
        self.destinationCarrier.text = details.carrier
        self.flightTime.text = "1:25"
    }
}
