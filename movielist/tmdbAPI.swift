//
//  tmdbAPI.swift
//  movielist
//
//  Created by Igor Pino de Souza on 04/05/21.
//

import Foundation


class TmdbAPI {
    
    private static let nowPlayingURL = "https://api.themoviedb.org/3/movie/now_playing?api_key=f321a808e68611f41312aa8408531476"
    // private static let apiKey = "f321a808e68611f41312aa8408531476"
    
    private static let configuration: URLSessionConfiguration = {
            let config = URLSessionConfiguration.default
            config.allowsCellularAccess = false
            config.httpAdditionalHeaders = ["Content-Type": "application/json"]
            config.timeoutIntervalForRequest = 10.0
            config.httpMaximumConnectionsPerHost = 5
            return config
        }()
    
    private static let session = URLSession(configuration: configuration)
    
    class func loadMovies() {
            
            guard let url = URL(string: nowPlayingURL) else {return}
            let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                if error == nil {
                    guard let response = response as? HTTPURLResponse else {return}
                    print(response.statusCode)
                    if response.statusCode == 200 {
                        guard let data = data else {return}
                        print(data)
                        do {
                            let movies = try JSONDecoder().decode([Movie].self, from: data)
                            for movie in movies {
                                print(movie)
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                } else {
                    print("Algum status inválido pelo servidor")
                }
            }
            dataTask.resume()
        }
    

    func loadMovies() {
        let urlPrincipal = "https://api.themoviedb.org/3/movie/now_playing?api_key=f321a808e68611f41312aa8408531476"
        DispatchQueue.main.async {
            guard let url = URL(string: urlPrincipal),
                  let JSONdata = try? Data(contentsOf: url) else { return }
            if let data = try? JSONDecoder().decode(results.self, from: JSONdata) {
//                self.movies = data.movies
//                self.tableView.reloadData()
            } else {
                print("Algo deu errado")
            }
        }
    }

    func loadGenresIds() {
        let urlPrincipal = "https://api.themoviedb.org/3/genre/movie/list?api_key=f321a808e68611f41312aa8408531476&language=pt-BR"
        DispatchQueue.main.async { [self] in
            guard let url = URL(string: urlPrincipal),
                  let JSONdata = try? Data(contentsOf: url) else { return }
            if let data = try? JSONDecoder().decode(genreArray.self, from: JSONdata) {
                //self.genre = data.genres
                //self.getGenre(self.genre, self.movies[0].genreIDS)
                //self.tableView.reloadData()
            } else {
                print("Erro inesperado")
            }
        }
    }
}
