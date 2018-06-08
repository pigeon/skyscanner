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
    
    func testFormatFlightTime() {
        XCTAssertTrue(interactor.formatFlightTime("2018-06-10T06:20:00") == "07:20","time is not matching")
        XCTAssertTrue(interactor.formatFlightTime("2018-06-18T16:20:00") == "17:20","time is not matching")
        XCTAssertTrue(interactor.formatFlightTime("2018-06-15T20:20:00") == "21:20","time is not matching")
    }
    
    func testFlightDuration() {
        XCTAssertTrue(interactor.flightDuration(minutes: 25) == "25m", "Flight time conversion is not correct")
        XCTAssertTrue(interactor.flightDuration(minutes: 0) == "0m", "Flight time conversion is not correct")
        XCTAssertTrue(interactor.flightDuration(minutes: 65) == "1h 5m", "Flight time conversion is not correct")
        XCTAssertTrue(interactor.flightDuration(minutes: 300) == "5h", "Flight time conversion is not correct")
        XCTAssertTrue(interactor.flightDuration(minutes: 217) == "3h 37m", "Flight time conversion is not correct")
    }
    
    class MockPresenter: FlightsSearchInteractorOutput {
        func flights(_: [BookingDetails]) {
            
        }
        
        func error(_: NSError) {
            
        }
        
    }
}
