//
//  ImagesImagesInteractorTests.swift
//  Movies
//
//  Created by Dmytro Golub on 09/04/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

import XCTest
@testable import FlightsSearch

class MoviesListInteractorTests: XCTestCase {

    
    let interactor = FlightsSearchInteractor()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testVotesString() {
        XCTAssertTrue(interactor.vote(for: 6.6) == "66%", "Not expected vote")
        XCTAssertTrue(interactor.vote(for:  0.6) == "6%", "Not expected vote")
        XCTAssertTrue(interactor.vote(for:  5.5) == "55%", "Not expected vote")
        XCTAssertTrue(interactor.vote(for:  10.0) == "100%", "Not expected vote")
        XCTAssertTrue(interactor.vote(for:  0.0) == "0%", "Not expected vote")
        XCTAssertFalse(interactor.vote(for:  1.0) == "5%", "Not expected vote")
    }
    
    func testDateFormatting() {
        let expected = "February 07, 2018"
        let actual = interactor.formatDate("2018-02-07")
        XCTAssertTrue( expected == actual,"Not expected date format. Expected \(expected) - actual \(String(describing: actual))")
    }

    func testColour() {
        XCTAssertTrue(interactor.colour(for: 8.0) == greenColour, "Colour not expected")
        XCTAssertTrue(interactor.colour(for: 7.0) == greenColour, "Colour not expected")
        XCTAssertTrue(interactor.colour(for: 5.1) == UIColor.orange, "Colour not expected")
        XCTAssertTrue(interactor.colour(for: 4) == UIColor.orange, "Colour not expected")
        XCTAssertTrue(interactor.colour(for: 3.9) == UIColor.red, "Colour not expected")
        XCTAssertTrue(interactor.colour(for: 0.9) == UIColor.red, "Colour not expected")
    }
    
    class MockPresenter: FlightsSearchInteractorOutput {
        func error(_: NSError) {
            
        }
        
        func movies(_: [Movie]) {
            
        }
    }
}
