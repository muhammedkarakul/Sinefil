//
//  MovieDetail.swift
//  Sinefil
//
//  Created by Muhammed KARAKUL on 28.01.2020.
//  Copyright © 2020 Muhammed KARAKUL. All rights reserved.
//

import Foundation

struct MovieDetail: Codable {
    let title: String?
    let year: String?
    let rated: String?
    let relased: String?
    let runtime: String?
    let genre: String?
    let director: String?
    let writer: String?
    let actors: String?
    let plot: String?
    let language: String?
    let country: String?
    let awards: String?
    let poster: String?
    let ratings: [Rating]
    let metascore: String?
    let imdbRating: String?
    let imdbVotes: String?
    let imdbID: String?
    let type: String?
    let dvd: String?
    let boxOffice: String?
    let production: String?
    let website: String?
    let response: String?
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case relased = "Relased"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating
        case imdbVotes
        case imdbID
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
    
    internal func getDictionary() -> [String : String?] {
        let dict = [
            NSLocalizedString("year", comment: "Year of movie.") : year,
            NSLocalizedString("rated", comment: "Rate of movie.") : rated,
            NSLocalizedString("relased", comment: "Release date of movie.") : relased,
            NSLocalizedString("runtime", comment: "Runtime of movie.") : runtime,
            NSLocalizedString("genre", comment: "Genre of movie.") : genre,
            NSLocalizedString("director", comment: "Director of movie.") : director,
            NSLocalizedString("writer", comment: "Writer of movie.") : writer,
            NSLocalizedString("actors", comment: "Actors of movie.") : actors,
            NSLocalizedString("plot", comment: "Plot of movie.") : plot,
            NSLocalizedString("language", comment: "Language of movie.") : language,
            NSLocalizedString("country", comment: "Country of movie.") : country,
            NSLocalizedString("awards", comment: "Awards of movie.") : awards,
            NSLocalizedString("metascore", comment: "Metascore of movie.") : metascore,
            NSLocalizedString("imdb_rating", comment: "IMDB rating of movie.") : imdbRating,
            NSLocalizedString("imdb_votes", comment: "IMDB votes of movie.") : imdbVotes,
            NSLocalizedString("type", comment: "Type of movie.") : type,
            "DVD" : dvd,
            NSLocalizedString("box_office", comment: "Box office of movie.") : boxOffice,
            NSLocalizedString("production", comment: "Production of movie.") : production,
            NSLocalizedString("website", comment: "Website of movie.") : website
        ]
        return dict
    }
}
