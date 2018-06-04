//
//  ImagesImagesConfigurator.swift
//  Movies
//
//  Created by Dmytro Golub on 09/04/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

import UIKit

class FlightsSearchModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? FlightsSearchViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: FlightsSearchViewController) {


        let presenter = FlightsSearchPresenter()
        presenter.view = viewController

        let interactor = FlightsSearchInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
