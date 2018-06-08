//
//  FlightsSearchViewInput.swift
//
//
//  Created by magic on 08/06/2018.
//
//

import Foundation

protocol FlightsSearchViewInput: class {

    /**
        @author Dmytro Golub
        Setup initial state of the view
    */

    func setupInitialState()
    func reload()
    func show(error:NSError)
}
