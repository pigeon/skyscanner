//
//  MoviesListInteractor.swift
//  Movies
//
//  Created by Dmytro Golub on 09/04/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
//

import Foundation
import UIKit

let greenColour = UIColor(red: 0, green: 0.6588, blue: 0.251, alpha: 1.0)

struct Movie {
    let imageURL:String
    let movieTitle:String
    let movieDescription:String
    let rating:NSAttributedString
    let releaseDate:String
    
    init?(url: String?, title: String?, overview: String?, vote: NSAttributedString?, date: String?) {
        if let url = url,
            let title = title,
            let overview = overview,
            let vote = vote,
            let date = date {
            imageURL = url
            movieTitle = title
            movieDescription = overview
            rating = vote
            releaseDate = date
        } else {
            return nil
        }
    }
    
}

class FlightsSearchInteractor: FlightsSearchInteractorInput {

    weak var output: FlightsSearchInteractorOutput!
    let movieDBAPI:MoviesService
    
    var numberOfPages = 0
    var currentPage = 0
    
    lazy var dateFormatterFrom:DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()

    lazy var dateFormatterTo:DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter
    }()
    
    init(service:MoviesService = MoviesServiceImpl()) {
        movieDBAPI = service
    }
    
    func formatDate(_ date:String?) -> String? {
        
        guard let date = date else {
            return nil
        }

        if let d = dateFormatterFrom.date(from: date){
            return dateFormatterTo.string(from: d)
        }
        return date
    }
    
    func colour(for vote:Double) -> UIColor {
        if vote >= 7.0 {
            return greenColour
        } else if vote >= 4.0 {
            return UIColor.orange
        }
        return UIColor.red
    }
    
    func vote(for rating:Double) -> String {
        // I assume here that the max vote on TMDB is 10. I haven't found this information in API describtion
        return String(format: "%.0f%%", (rating / 10.0) * 100.0)
    }
    
    func formatVotes(rating:Double?) -> NSAttributedString? {
        guard let rating = rating else {
            return nil
        }
        let stringColor = [ NSAttributedStringKey.foregroundColor: self.colour(for: rating)]
        return NSAttributedString(string: self.vote(for: rating), attributes: stringColor)
    }
    
    func movieImageURL(id:String?) -> String? {
        guard let id = id else {
            return nil
        }
        return "http://image.tmdb.org/t/p/w500/\(id)"
    }
    
    func getMovies() {
        movieDBAPI.movies(page: currentPage + 1) { [weak self] res,error  in
            if let res = res,
                let results = res.results {
                self?.currentPage = res.page!
                self?.numberOfPages = res.total_pages!
                var resultedMovies:[Movie] = []
                results.forEach {
                    let movie = Movie(url: self?.movieImageURL(id:$0.poster_path),
                                      title: $0.title,
                                      overview: $0.overview,
                                      vote: self?.formatVotes(rating:$0.vote_average),
                                      date: self?.formatDate($0.release_date))
                    if let movie = movie {
                        resultedMovies.append(movie)
                    }
                }
                DispatchQueue.main.async {
                    self?.output.movies( resultedMovies )
                }
            } else {
                self?.output.error(error!)
            }
        }
    }
    
}
