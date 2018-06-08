//
//  ImagesImagesPresenter.swift
//
//
//  Created by magic on 08/06/2018.
//
//

import UIKit

class FlightsSearchPresenter: FlightsSearchModuleInput, FlightsSearchViewOutput, FlightsSearchInteractorOutput {
    
    weak var view: FlightsSearchViewInput!
    var interactor: FlightsSearchInteractorInput!
    var selectedImageIndex:IndexPath?
    
    var flightsList:[BookingDetails] = [] {
        didSet {
            DispatchQueue.main.async {
                self.view.reload()
            }
        }
    }

    func viewIsReady() {
        interactor.findFlights()
    }
    
    func title() -> String {
        return NSLocalizedString("", comment: "")
    }
    
    
    func numberOfItemsInSection() -> Int {
        return 3 
    }
    
    func numberOfSections() -> Int {
        return flightsList.count
    }

    
    func flights(_ flights: [BookingDetails]) {
        if self.flightsList.isEmpty {
            self.flightsList = flights
        } else {
            self.flightsList.append(contentsOf: flights)
        }
        DispatchQueue.main.async {
            self.view.reload()
        }
    }
    
    func error(_ error: NSError) {
        view.show(error: error)
    }
    
    func dataModel(with index: IndexPath) -> BookingDetails {
        return  flightsList[index.section]
    }
    
    func movieSelected(at index: IndexPath) {
        selectedImageIndex = index
    }
    
}
