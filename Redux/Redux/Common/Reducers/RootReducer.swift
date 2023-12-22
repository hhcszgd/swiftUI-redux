//
//  RootReducer.swift
//  Redux
//
//  Created by hhcszgd on 2023/12/22.
//

import Foundation

typealias Dispatcher = (Action) -> Void
typealias RootReducer<State: ReduxState> = (_ state: State, _ action: Action) -> State

func rootReducer(_ state: RootState, action: Action) -> RootState {

    var state = state
    state.movies = moviesReducer(state.movies, action: action)
    return state
}
