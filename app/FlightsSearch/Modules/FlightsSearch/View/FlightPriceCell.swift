//
//  FlightPrice.swift
//
//
//  Created by magic on 08/06/2018.
//
//

import Foundation
import UIKit


class FlightPriceCell : UITableViewCell {
    
    
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var shortestCheapest: UILabel!
    @IBOutlet weak var numberOfBookings: UILabel!
    
    
    func price(with value:Double, currency:String) -> String {
        let price = value as NSNumber
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency
        return formatter.string(from: price) ?? "\(value)"
    }
    
    func configureCell(details:BookingDetails) {
        rating.textColor = UIColor.FlightDetails.mainTextColor
        price.textColor = UIColor.FlightDetails.mainTextColor
        shortestCheapest.textColor = UIColor.FlightDetails.greenTextColor
        numberOfBookings.textColor = UIColor.FlightDetails.secondaryTextColor
        
        price.text = self.price(with: details.price, currency: details.currency)
        rating.text = "10.0"
        shortestCheapest.text = "Cheapest Shortest"
        numberOfBookings.text = "2 bookings required"
    }
}
