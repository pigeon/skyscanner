//
//  ImagesImagesConfigurator.swift
//
//
//  Created by magic on 08/06/2018.
//
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
