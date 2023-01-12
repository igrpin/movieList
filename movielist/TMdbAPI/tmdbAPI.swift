//
//  tmdbAPI.swift
//  movielist
//
//  Created by Igor Pino de Souza on 04/05/21.
//

import Foundation


class TmdbAPI {
    
    private static let apiKey: String = "f321a808e68611f41312aa8408531476"
    private static let languagePtBr: String = "&language=pt-BR"
    
    static func loadMoviesNowPlaying(_ page: Int = 1, _ completion: @escaping (Result<APICallResult, Error>) -> Void) {
        let urlPrincipal = "\(TmdbEndpoints.API_MAIN_URL)/movie/now_playing?api_key=" + apiKey + "&page=\(page)"
        DispatchQueue.main.async {
            guard let url = URL(string: urlPrincipal),
            let JSONdata = try? Data(contentsOf: url) else { return }
            if let data = try? JSONDecoder().decode(APICallResult.self, from: JSONdata) {
                print("Pages total: \(data.totalPages)")
                print("Current page: \(data.page)")
                print("Results total: \(data.totalResults)")
                completion(.success(data))
            } else {
                print("Something went wrong")
            }
        }
    }

    static func loadGenresIds(_ completion: @escaping (_ genres: [Genre]) -> ()) {
        let urlPrincipal = "\(TmdbEndpoints.API_MAIN_URL)/genre/movie/list?api_key=" + apiKey + languagePtBr
        DispatchQueue.main.async {
            guard let url = URL(string: urlPrincipal),
                  let JSONdata = try? Data(contentsOf: url) else { return }
            if let data = try? JSONDecoder().decode(genreArray.self, from: JSONdata) {
                let genres = data.genres
                completion(genres)
                //self.genre = data.genres
                //self.getGenre(self.genre, self.movies[0].genreIDS)
                //self.tableView.reloadData()
            } else {
                print("Erro inesperado")
            }
        }
    }
}
