//
//  ImagesImagesConfiguratorTests.swift
//
//
//  Created by magic on 08/06/2018.
//
//

import XCTest
@testable import FlightsSearch

class FlightsSearchModuleConfiguratorTests: XCTestCase {

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
        let configurator = FlightsSearchModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "FlightsSearchViewController is nil after configuration")
        XCTAssertTrue(viewController.output is FlightsSearchPresenter, "output is not ImagesPresenter")

        let presenter: FlightsSearchPresenter = viewController.output as! FlightsSearchPresenter
        XCTAssertNotNil(presenter.view, "view in ImagesPresenter is nil after configuration")

        let interactor: FlightsSearchInteractor = presenter.interactor as! FlightsSearchInteractor
        XCTAssertNotNil(interactor.output, "output in ImagesInteractor is nil after configuration")
    }

    class ImagesViewControllerMock: FlightsSearchViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
