//
//  MoviesModuleConfiguratorTests.swift
//  Movies
//
//  Created by Dmytro Golub on 09/04/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

import XCTest
@testable import Movies

class MoviesModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = ImagesViewControllerMock()
        let configurator = MoviesModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "ImagesViewController is nil after configuration")
        XCTAssertTrue(viewController.output is MoviesListPresenter, "output is not ImagesPresenter")

        let presenter: MoviesListPresenter = viewController.output as! MoviesListPresenter
        XCTAssertNotNil(presenter.view, "view in ImagesPresenter is nil after configuration")

        let interactor: MoviesListInteractor = presenter.interactor as! MoviesListInteractor
        XCTAssertNotNil(interactor.output, "output in ImagesInteractor is nil after configuration")
    }

    class ImagesViewControllerMock: MoviesViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
