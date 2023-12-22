//
//  ViewExtersion.swift
//  Redux
//
//  Created by hhcszgd on 2023/12/22.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView{
            self
        }
    }
}
