//
//  MoviesState.swift
//  Redux
//
//  Created by hhcszgd on 2023/12/22.
//

import Foundation


struct MoviesState: ReduxState {
    var movies = [Movie]()
    var selectedMovieDetail: MovieDetail?
}
