//
//  apitmdb.swift
//  movielist
//
//  Created by Igor Pino de Souza on 06/05/21.
//

import Foundation

class Apitmdb {
    
    var movies = [Movie]()
    
    func loadMovies() {
        let urlPrincipal = "https://api.themoviedb.org/3/movie/now_playing?api_key=f321a808e68611f41312aa8408531476"
        DispatchQueue.main.async {
            guard let url = URL(string: urlPrincipal),
            let JSONdata = try? Data(contentsOf: url) else { return }
            if let data = try? JSONDecoder().decode(results.self, from: JSONdata) {
                self.movies = data.movies
                //self.tableView.reloadData()
            } else {
              print("Algo deu errado")
            }
          }
    }
    
    
//    func getPosterImage(posterPath url: String, imageView iv: UIImageView) {
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
