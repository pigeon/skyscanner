//
//  ImagesImagesInteractorTests.swift
//
//
//  Created by magic on 08/06/2018.
//
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
        XCTAssertTrue(interactor.flightDuration(minutes: nil) == "unknown", "Flight time conversion is not correct")
        XCTAssertTrue(interactor.flightDuration(minutes: 25) == "25m", "Flight time conversion is not correct")
        XCTAssertTrue(interactor.flightDuration(minutes: 0) == "0m", "Flight time conversion is not correct")
        XCTAssertTrue(interactor.flightDuration(minutes: 65) == "1h 5m", "Flight time conversion is not correct")
        XCTAssertTrue(interactor.flightDuration(minutes: 300) == "5h", "Flight time conversion is not correct")
        XCTAssertTrue(interactor.flightDuration(minutes: 217) == "3h 37m", "Flight time conversion is not correct")
    }
    
    func checkNextMonday(for date:String, expectedDate:String) {
        let date = interactor.dateFormatterFrom.date(from:date)
        let nextMonday = interactor.dateFormatterFlayingDate.string(from:interactor.nextMonday(since: date!))
        XCTAssertTrue( nextMonday == expectedDate, "next monday date is not expected")
    }
    
    func testNextMonday() {
        checkNextMonday(for: "2018-05-28T06:50:00", expectedDate: "2018-06-04")
        checkNextMonday(for: "2018-05-20T06:50:00", expectedDate: "2018-05-21")
        checkNextMonday(for: "2018-05-08T06:50:00", expectedDate: "2018-05-14")
    }

    func checkNextDay(for date:String, expectedDate:String) {
        let date = interactor.dateFormatterFrom.date(from:date)
        let nextDay = interactor.dateFormatterFlayingDate.string(from:interactor.nextDay(after:date!))
        XCTAssertTrue( nextDay == expectedDate, "next day date is not expected")
    }
    
    func testNextDay() {
        checkNextDay(for: "2018-05-28T06:50:00", expectedDate: "2018-05-29")
        checkNextDay(for: "2018-04-08T06:50:00", expectedDate: "2018-04-09")
        checkNextDay(for: "2018-12-20T06:50:00", expectedDate: "2018-12-21")
        checkNextDay(for: "2018-09-01T06:50:00", expectedDate: "2018-09-02")

    }
    
    class MockPresenter: FlightsSearchInteractorOutput {
        func flights(_: [BookingDetails]) {
            
        }
        
        func error(_: NSError) {
            
        }
        
    }
}
