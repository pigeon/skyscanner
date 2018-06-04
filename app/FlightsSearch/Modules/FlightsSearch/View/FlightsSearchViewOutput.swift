//
//  ImagesImagesViewOutput.swift
//  Movies
//
//  Created by Dmytro Golub on 09/04/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//
import UIKit

protocol FlightsSearchViewOutput {

    /**
        @author Dmytro Golub
        Notify presenter that view is ready
    */

    func viewIsReady()
    func numberOfItemsInSection() -> Int
    func dataModel(with index:IndexPath) -> Movie
    func movieSelected(at index:IndexPath)
    func prepare(for segue: UIStoryboardSegue)
    func title() -> String
}
