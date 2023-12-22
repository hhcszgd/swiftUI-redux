//
//  WebLoader.swift
//  Redux
//
//  Created by hhcszgd on 2023/12/22.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case decodingError
    case noData
}

struct WebLoader {
    func fetchMovieDetailBy(imdbID: String, completion: @escaping (Result<MovieDetail?, NetworkError>) -> Void) {
        guard let url = URL(string: "http://www.omdbapi.com/?apikey=e42c0cbd&i=\(imdbID)") else {
            completion(.failure(.badURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            let movieDetailResponse = try? JSONDecoder().decode(MovieDetail.self, from: data)
            if let movieDetailResponse = movieDetailResponse {
                completion(.success(movieDetailResponse))
            } else {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
    
    func fetchMoviesBy(keyword: String, completion: @escaping (Result<[Movie], NetworkError>) -> Void) {
        guard let url = URL(string: "http://www.omdbapi.com/?apikey=e42c0cbd&s=\(keyword.urlEncode())") else {
            completion(.failure(.badURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
            print(movieResponse)
            if let movieResponse = movieResponse {
                completion(.success(movieResponse.movies))
            } else {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
}


class ImageLoader: ObservableObject {
    @Published var loadedData: Data? = nil
    
    func loadImage(url: String) {
        guard let imageURL = URL(string: url) else {
            fatalError("invalid url")
        }
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL)
            DispatchQueue.main.async {
                self.loadedData = data
            }
        }
    }
}
