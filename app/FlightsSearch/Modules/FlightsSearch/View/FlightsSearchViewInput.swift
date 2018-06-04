//
//  ImagesImagesViewInput.swift
//  Movies
//
//  Created by Dmytro Golub on 09/04/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
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
