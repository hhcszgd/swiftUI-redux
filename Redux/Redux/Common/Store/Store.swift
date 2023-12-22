//
//  Store.swift
//  Redux
//
//  Created by hhcszgd on 2023/12/22.
//

import Foundation
import Combine

class Store<StoreState: ReduxState>: ObservableObject {
    @Published var state: StoreState
    var reducer: RootReducer<StoreState>
    var middleWares: [MiddleWare<StoreState>]
    
    init(state: StoreState, reducer: @escaping RootReducer<StoreState>, middleWares: [MiddleWare<StoreState>]) {
        self.state = state
        self.reducer = reducer
        self.middleWares = middleWares
    }
    
    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
        
        middleWares.forEach { middleware in
            middleware(state, action, dispatch(action:))
        }
    }
}
