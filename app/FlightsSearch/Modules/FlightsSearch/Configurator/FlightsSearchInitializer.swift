//
//  ImagesImagesInitializer.swift
//  Movies
//
//  Created by Dmytro Golub on 09/04/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

import UIKit

class FlightsSearchModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var imagesViewController: FlightsSearchViewController!

    override func awakeFromNib() {

        let configurator = FlightsSearchModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: imagesViewController)
    }

}
