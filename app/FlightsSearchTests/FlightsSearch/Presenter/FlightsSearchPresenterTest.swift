//
//PresenterTest.swift
//
//
//  Created by magic on 08/06/2018.
//
//

import XCTest
@testable import FlightsSearch

class MoviesPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: FlightsSearchInteractorInput {
        func findFlights() {
            
        }
        
        
        
    }

    class MockViewController: FlightsSearchViewInput {
        func reload() {
        }
        
        func show(error: NSError) {
            
        }
        

        func setupInitialState() {

        }
    }
}
