//
//  ContentView.swift
//  Redux
//
//  Created by hhcszgd on 2023/12/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: Store<RootState>
    @State var keyword: String = ""
    struct ViewModel {
        let movies: [Movie]
        let onSearch: (String) -> Void
    }
    
    private func mapToViewModel(state: MoviesState) -> ViewModel {
        ViewModel(movies: state.movies) { keyword in
            store.dispatch(action: FetchMoviesAction(keyword: keyword))
        }
    }
    
    func readBaseUrl() -> String? {
        guard let path = Bundle.main.path(forResource: "Info", ofType: "plist") else {
            return nil
        }
        let infoDic = NSDictionary(contentsOfFile: path)
        let host = infoDic?["DebugStage"] as? String
        return host
    }
    
    var body: some View {
        print(store)
        return VStack {
            let viewModel = mapToViewModel(state: store.state.movies)
            VStack{
                TextField("search", text: $keyword, onCommit: {
                    viewModel.onSearch(keyword)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
//                MovieDetailView
                List(viewModel.movies, id: \.imdbID) { movie in
                    NavigationLink(
                        destination: MovieDetailView(movie: movie),
                        label: {
                            MovieCell(movie: movie)
                        }
                    )
                }.listStyle(PlainListStyle())
            }.navigationTitle("Movies")
                .embedInNavigationView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct MovieCell: View {
    let movie: Movie
    var body: some View {
        HStack(alignment: .top, content: {
            URLImageView(url: movie.poster)
                .frame(width: 100, height: 125)
                .cornerRadius(10)
            Text(movie.title)
        })
    }
}
