//
//  tmdbAPI.swift
//  movielist
//
//  Created by Igor Pino de Souza on 04/05/21.
//

import Foundation


class TmdbAPI {
    
    private static let apiKey: String = "f321a808e68611f41312aa8408531476"
    
    static func loadMovies(_ completion: @escaping (_ movies: [Movie]) -> ()) {
        let urlPrincipal = "https://api.themoviedb.org/3/movie/now_playing?api_key=" + self.apiKey
        DispatchQueue.main.async {
            guard let url = URL(string: urlPrincipal),
                  let JSONdata = try? Data(contentsOf: url) else { return }
            if let data = try? JSONDecoder().decode(results.self, from: JSONdata) {
                let movies = data.movies
                completion(movies)
            } else {
                print("Algo deu errado")
            }
        }
    }

    static func loadGenresIds(_ completion: @escaping (_ genres: [Genre]) -> ()) {
        let urlPrincipal = "https://api.themoviedb.org/3/genre/movie/list?api_key=" + self.apiKey + "&language=pt-BR"
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

//    static func getPosterImage(posterPath url: String, completion: @escaping (_ imageView: UIImageView) -> ()) {
//        let baseURL = "https://image.tmdb.org/t/p/original"
//        print(url)
//        let url = URL(string: baseURL+url)
//
//        DispatchQueue.global().async {
//            let data = try? Data(contentsOf: url!)
//            DispatchQueue.main.async {
//                iv.image = UIImage(data: data!)
//            }
//        }
//    }

}
