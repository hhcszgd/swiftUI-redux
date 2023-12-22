//
//  Actions.swift
//  Redux
//
//  Created by hhcszgd on 2023/12/22.
//

import Foundation

protocol Action {}

struct FetchMoviesAction: Action {
    let keyword: String
}

struct SetupMoviesAction: Action {
    let movies: [Movie]
}

struct FetchMovieDetailAction: Action {
    let imdbID: String
}

struct SetupMovieDetailAction: Action {
    let movie: MovieDetail
}
