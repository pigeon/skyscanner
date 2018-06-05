//
//  ErrrorCompletionActions.swift
//  Movies
//
//  Created by Dmytro Golub on 09/04/2018.
//  Copyright © 2018 Paysafe. All rights reserved.
//

import Foundation

typealias AuthorisationCompletion = (String?,NSError?)->Void
typealias FlightsSearchCompletion =  (FlightSearchResults?,NSError?) -> Void


protocol CompletionAction {
    func add(error:NSError)
    func run()
}

class AuthorisationAction : CompletionAction {
    
    var err:NSError?
    let handler:AuthorisationCompletion
    
    init(completion:@escaping AuthorisationCompletion) {
        handler = completion
    }
    
    func add(error:NSError) {
        err = error
    }
    
    func run() {
        handler(nil,err)
    }
}

class SearchAction : CompletionAction {
    
    var err:NSError?
    let handler:FlightsSearchCompletion
    
    init(completion:@escaping FlightsSearchCompletion) {
        handler = completion
    }
    
    func run() {
        handler(nil,err)
    }
    
    func add(error:NSError) {
        err = error
    }
    
}
