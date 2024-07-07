//
//  ShowCaseList.swift
//  Redux
//
//  Created by hhcszgd on 2023/12/22.
//

import SwiftUI

struct ShowCaseList: View {
    @EnvironmentObject var store: Store<RootState>
    
    private func mapToViewModel(state: MoviesState) -> [ViewModel] {
        [
            ViewModel(title: "case 1"),
            ViewModel(title: "case 2"),
            ViewModel(title: "case 3"),
            ViewModel(title: "case 4"),
            
        ]
    }

    
    var body: some View {
        print(store)
        return VStack {
            let viewModels = mapToViewModel(state: store.state.movies)
            VStack{
                List(viewModels, id: \.uuid) { movie in
                    NavigationLink(
                        destination: TestRingProgressView(),
                        label: {
                            ShowCaseCell(viewModel: movie)
                        }
                    )
                }.listStyle(PlainListStyle())
            }.navigationTitle("Show Case List")
        }
        .padding()
    }
}

extension ShowCaseList {
    struct ViewModel {
        let title: String
        let uuid: UUID = UUID()
    }
}

#Preview {
    ShowCaseList()
}
