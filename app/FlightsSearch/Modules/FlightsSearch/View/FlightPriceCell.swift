//
//  FlightPrice.swift
//  FlightsSearch
//
//  Created by Dmytro Golub on 07/06/2018.
//  Copyright © 2018 Paysafe. All rights reserved.
//

import Foundation
import UIKit


class FlightPriceCell : UITableViewCell {
    
    
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var shortestCheapest: UILabel!
    @IBOutlet weak var numberOfBookings: UILabel!
    
    func configureCell(details:BookingDetails) {
        rating.textColor = UIColor.FlightDetails.mainTextColor
        price.textColor = UIColor.FlightDetails.mainTextColor
        
        price.text = "\(details.price)"
        rating.text = "😀 10.0"
    }
}
