//
//  ReduxApp.swift
//  Redux
//
//  Created by hhcszgd on 2023/12/22.
//

import SwiftUI

@main
struct ReduxApp: App {
    var body: some Scene {
        let store = Store(
            state: RootState(), reducer: rootReducer(_:action:), 
            middleWares: [
                moviesMiddleware()
            ]
        )
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
