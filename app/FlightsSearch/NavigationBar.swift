//
//  NavigationBar.swift
//  FlightsSearch
//
//  Created by Dmytro Golub on 09/06/2018.
//  Copyright © 2018 Paysafe. All rights reserved.
//

import Foundation
import UIKit


public extension UIView {
    

    public func addSubview(_ view: UIView, fillSuperView: Bool) {
        
        view.translatesAutoresizingMaskIntoConstraints = !fillSuperView
        
        self.addSubview(view)
        
        if fillSuperView == true {
            
            let horisontalConstrains = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|",
                                                                      options: NSLayoutFormatOptions(rawValue: 0),
                                                                      metrics: nil,
                                                                      views: ["view":view])
            
            let verticalConstrains = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|",
                                                                    options: NSLayoutFormatOptions(rawValue: 0),
                                                                    metrics: nil,
                                                                    views: ["view":view])
            
            self.addConstraints(horisontalConstrains)
            self.addConstraints(verticalConstrains)
        }
    }
}

class NavigationBar : UIView {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var dates: UILabel!
    @IBOutlet weak var sort: UILabel!
    @IBOutlet weak var filter: UILabel!
    @IBOutlet weak var numberOfResults: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    func commonInit() {
        guard let view = Bundle.main.loadNibNamed("NavigationBar", owner: self, options: nil)?.first as? UIView else {
            fatalError("Can't create navigation bar from xib file")
        }
        
        self.title.textColor = UIColor.FlightDetails.mainTextColor
        self.dates.textColor = UIColor.FlightDetails.secondaryTextColor
        self.numberOfResults.textColor = UIColor.FlightDetails.secondaryTextColor

        self.sort.textColor = UIColor.FlightDetails.navBarButtonsTextColor
        self.filter.textColor = UIColor.FlightDetails.navBarButtonsTextColor

        
        self.addSubview(view, fillSuperView: true)
    }

}
