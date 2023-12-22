//
//  MoviesReducer.swift
//  Redux
//
//  Created by hhcszgd on 2023/12/22.
//

import Foundation

func moviesReducer(_ state: MoviesState, action: Action) -> MoviesState {

    var state = state
    switch action {
    case let setupMoviesAction as SetupMoviesAction:
//        WebLoader().fetchMoviesBy(keyword: fetchMoviesAction.keyword, completion: <#T##(Result<[Movie], NetworkError>) -> Void#>)
        state.movies = setupMoviesAction.movies
    case let setupMovieDetail as SetupMovieDetailAction:
        state.selectedMovieDetail = setupMovieDetail.movie
    default:
        break
    }
    return state
}
