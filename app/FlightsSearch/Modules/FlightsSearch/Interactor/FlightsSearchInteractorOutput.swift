//
//  ImagesImagesInteractorOutput.swift
//
//
//  Created by magic on 08/06/2018.
//
//

import Foundation

protocol FlightsSearchInteractorOutput: class {
    func flights(_:[BookingDetails])
    func error(_:NSError)
}
