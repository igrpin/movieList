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
    var genreName: String!
    
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
        lbReleaseDate.text = DateConfig().dateFormat(date: movie.releaseDate)
        tvOverview.text = movie.overview
        lbLanguage.text = movie.originalLanguage
        lbGender.text = genreName
        self.getPosterImage(posterPath: movie.posterPath, imageView: ivPoster)
    }
    
    
    /* Referência:
    https://stackoverflow.com/questions/24231680/loading-downloading-image-from-url-on-swift
    */
    func getPosterImage(posterPath url: String, imageView iv: UIImageView) {
        let baseURL = "https://image.tmdb.org/t/p/original"
        let url = URL(string: baseURL+url)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                iv.image = UIImage(data: data!)
            }
        }
    }

}
