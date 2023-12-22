//
//  MiddleWare.swift
//  Redux
//
//  Created by hhcszgd on 2023/12/22.
//

import Foundation

typealias MiddleWare<State: ReduxState> = (State, Action, @escaping Dispatcher) -> Void

func moviesMiddleware() -> MiddleWare<RootState> {
    return { state, action, dispatch in
        switch action {
        case let action as FetchMoviesAction:
            WebLoader().fetchMoviesBy(keyword: action.keyword.urlEncode()) { result in
                switch result {
                case .success(let movies):
                    if !movies.isEmpty {
                        dispatch(SetupMoviesAction(movies: movies))
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case let action as FetchMovieDetailAction:
            WebLoader().fetchMovieDetailBy(imdbID: action.imdbID) { result in
                switch result {
                case .success(let movie):
                    if let movie = movie {
                        dispatch(SetupMovieDetailAction(movie: movie))
                    } else {
                        print("error")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        default:
            break
        }
    }
}
