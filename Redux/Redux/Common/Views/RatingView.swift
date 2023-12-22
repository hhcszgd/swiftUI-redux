//
//  File.swift
//  Redux
//
//  Created by hhcszgd on 2023/12/22.
//

import SwiftUI

struct RatingView: View {
    @State var rating: Int?
    
    private func startType(index: Int) -> String {
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    var body: some View {
        HStack {
            ForEach(1...10, id: \.self) { index in
                Image(systemName: self.startType(index: index))
                    .foregroundColor(Color.orange)
                    .onTapGesture {
                        self.rating = index
                    }
            }
        }
    }
}
