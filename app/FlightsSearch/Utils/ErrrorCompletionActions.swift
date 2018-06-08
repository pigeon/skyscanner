//
//  ErrrorCompletionActions.swift
//
//
//  Created by magic on 08/06/2018.
//
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
