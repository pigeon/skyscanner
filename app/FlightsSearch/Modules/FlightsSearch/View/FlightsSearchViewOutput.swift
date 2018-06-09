//
//  ImagesImagesViewOutput.swift
//
//
//  Created by magic on 08/06/2018.
//
//
import UIKit

protocol FlightsSearchViewOutput {

    /**
        @author Dmytro Golub
        Notify presenter that view is ready
    */

    func viewIsReady()
    func numberOfItemsInSection() -> Int
    func numberOfSections() -> Int
    func dataModel(with index:IndexPath) -> BookingDetails
    
    func title() -> String
    func subTitle()->String
    func numberOfResults()->String

}
