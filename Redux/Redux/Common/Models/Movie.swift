//
//  Movie.swift
//  Redux
//
//  Created by hhcszgd on 2023/12/22.
//

import Foundation


struct MovieResponse: Decodable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}
struct Movie: Decodable {
    var title: String
    var imdbID: String
    var poster: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case imdbID
        case poster = "Poster"
    }
}


struct MovieDetail: Decodable {
    let title : String
    let plot: String
    let imdbRating: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case plot = "Plot"
        case imdbRating = "imdbRating"
        case poster = "Poster"
    }
}
