//
//  ImagesImagesInitializer.swift
//
//
//  Created by magic on 08/06/2018.
//
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
