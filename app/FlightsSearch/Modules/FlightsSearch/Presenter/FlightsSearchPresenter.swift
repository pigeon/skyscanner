//
//  ImagesImagesPresenter.swift
//  Movies
//
//  Created by Dmytro Golub on 09/04/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

import UIKit

class FlightsSearchPresenter: FlightsSearchModuleInput, FlightsSearchViewOutput, FlightsSearchInteractorOutput {

    weak var view: FlightsSearchViewInput!
    var interactor: FlightsSearchInteractorInput!
    var selectedImageIndex:IndexPath?
    
    var moviesList:[BookingDetails] = [] {
        didSet {
          view.reload()
        }
    }

    func viewIsReady() {
        interactor.findFlights()
    }
    
    func title() -> String {
        return NSLocalizedString("Popular Movies", comment: "")
    }
    
    func numberOfItemsInSection() -> Int {
        return moviesList.count
    }
    
    func movies(_ movies: [BookingDetails]) {
        if self.moviesList.isEmpty {
           self.moviesList = movies
        } else {
            self.moviesList.append(contentsOf: movies)
        }
        view.reload()
    }

    func error(_ error: NSError) {
        view.show(error: error)
    }
    
    func dataModel(with index: IndexPath) -> BookingDetails {
        if index.row == (moviesList.count - 1) {
            interactor.findFlights()
        }
        return  moviesList[index.row]
    }
    
    func movieSelected(at index: IndexPath) {
        selectedImageIndex = index
    }
    
    func prepare(for segue: UIStoryboardSegue) {
//        guard let dest = segue.destination as? FullScreenViewController ,
//            let module = dest.output as? FullScreenModuleInput,
//            let index = selectedImageIndex else {
//            return
//        }
//        module.imageURL = moviesList[index.row].imageURL
//        module.title = moviesList[index.row].movieTitle
        
    }
    
}
