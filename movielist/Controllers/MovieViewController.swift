//
//  MovieViewController.swift
//  movielist
//
//  Created by Igor Pino de Souza on 04/05/21.
//

import UIKit

class MovieViewController: UIViewController {
    
    var movie: Movie!
    var genre: Genre!
    
    @IBOutlet weak var lbMovieTitle: UILabel!
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lbReleaseDate: UILabel!
    @IBOutlet weak var lbLanguage: UILabel! //ISO 639-1
    @IBOutlet weak var lbGender: UILabel!
    @IBOutlet weak var tvOverview: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeOutlets()
        
    }
    
    func changeOutlets () {
        lbMovieTitle.text = movie.title
        lbReleaseDate.text = movie.releaseDate
        tvOverview.text = movie.overview
        lbLanguage.text = movie.originalLanguage
        self.getPosterImage(posterPath: movie.posterPath, imageView: ivPoster)
//        lbGender.text = "\(genre.name)"
    }
    
    
    /* Referência:
    https://stackoverflow.com/questions/24231680/loading-downloading-image-from-url-on-swift
    */
    func getPosterImage(posterPath url: String, imageView iv: UIImageView) {
        let baseURL = "https://image.tmdb.org/t/p/original"
        print(url)
        let url = URL(string: baseURL+url)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                iv.image = UIImage(data: data!)
            }
        }
    }
    

    
    
//    var movies = [Movie]()
//
//    func loadMovies() {
//        let urlPrincipal = "https://api.themoviedb.org/3/movie/now_playing?api_key=f321a808e68611f41312aa8408531476"
//        DispatchQueue.main.async {
//            guard let url = URL(string: urlPrincipal),
//            let JSONdata = try? Data(contentsOf: url) else { return }
//            if let data = try? JSONDecoder().decode(results.self, from: JSONdata) {
//                self.movies = data.movies
//                print(self.movies)
//                // self.tableView.reloadData()
//            } else {
//              print("Algo deu errado")
//            }
//          }
//
//    }

}
