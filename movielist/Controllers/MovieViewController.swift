//
//  MovieViewController.swift
//  movielist
//
//  Created by Igor Pino de Souza on 04/05/21.
//

import UIKit

class MovieViewController: UIViewController {
    
    let BASE_IMAGE_URL = "https://image.tmdb.org/t/p/original"
    
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
    
    func changeOutlets() {
        lbMovieTitle.text = movie.title
        lbReleaseDate.text = DateConfig().dateFormat(date: movie.releaseDate)
        tvOverview.text = movie.overview
        lbLanguage.text = movie.originalLanguage
        lbGender.text = genreName
        ivPoster.kf.setImage(with: URL(string: BASE_IMAGE_URL+movie.posterPath))
    }
}
