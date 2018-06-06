//
//  ImagesImagesInteractorOutput.swift
//  Movies
//
//  Created by Dmytro Golub on 09/04/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

import Foundation

protocol FlightsSearchInteractorOutput: class {
    func flights(_:[BookingDetails])
    func error(_:NSError)
}
