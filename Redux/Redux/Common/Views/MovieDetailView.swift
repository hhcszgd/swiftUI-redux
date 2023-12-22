//
//  MovieDetailView.swift
//  Redux
//
//  Created by hhcszgd on 2023/12/22.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @EnvironmentObject var store: Store<RootState>
    private struct ViewModel {
        let detail: MovieDetail?
        let onLoadMovieDetail: (String) -> Void
    }
    
    private func convertToViewModel(state: MoviesState) -> ViewModel {
        ViewModel(detail: state.selectedMovieDetail) { imdbID in
            store.dispatch(action: FetchMovieDetailAction(imdbID: imdbID))
        }
    }
    
    var body: some View {
        VStack{
            let viewModel = convertToViewModel(state: store.state.movies)
            Group {
                if let detail = viewModel.detail {
                    VStack(alignment:.leading, content: {
                        HStack(content: {
                            Spacer()
                            URLImageView(url: detail.poster)
                            Spacer()
                        })
                        Text(detail.title).padding(5)
                            .font(.title)
                        ScrollView {
                            Text(detail.plot + detail.plot + detail.plot + detail.plot).padding(5)
                                .font(.subheadline)
                        }
                        HStack(content: {
                            Text("Rating")
                            RatingView(rating: detail.imdbRating.convertToIntValue())
                        })
                        Spacer()
                    })
                } else {
                    Text("Loading ...")
                }
            }.onAppear(perform: {
                viewModel.onLoadMovieDetail(movie.imdbID)
            })
        }
    }
}

#Preview {
    MovieDetailView(movie: Movie(title: "", imdbID: "", poster: ""))
}
