//
//  RootState.swift
//  Redux
//
//  Created by hhcszgd on 2023/12/22.
//

import Foundation

protocol ReduxState {}

struct RootState: ReduxState {
    var movies = MoviesState()
}
