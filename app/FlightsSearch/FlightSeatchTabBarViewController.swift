//
//  FlightSeatchTabBarViewController.swift
//
//  Created by magic on 08/06/2018.
//

import Foundation
import UIKit


class FlightSeatchTabBarViewController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.selectedIndex = 1
    }
    
}
