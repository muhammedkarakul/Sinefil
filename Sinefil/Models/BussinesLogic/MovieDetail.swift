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
            "Year" : year,
            "Rated" : rated,
            "Relased" : relased,
            "Runtime" : runtime,
            "Genre" : genre,
            "Director" : director,
            "Writer" : writer,
            "Actors" : actors,
            "Plot" : plot,
            "Language" : language,
            "Country" : country,
            "Awards" : awards,
            "Metascore" : metascore,
            "IMDB Rating" : imdbRating,
            "IMDB Votes" : imdbVotes,
            "Type" : type,
            "DVD" : dvd,
            "Box Office" : boxOffice,
            "Production" : production,
            "Website" : website
        ]
        return dict
    }
}
