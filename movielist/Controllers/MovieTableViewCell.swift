//
//  MovieTableViewCell.swift
//  movielist
//
//  Created by Igor Pino de Souza on 06/05/21.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {

    let BASE_IMAGE_URL = "https://image.tmdb.org/t/p/original"
    
    @IBOutlet weak var lbMovieTitle: UILabel!
    @IBOutlet weak var lbReleaseDate: UILabel!
    @IBOutlet weak var lbGender: UILabel!
    @IBOutlet weak var ivPoster: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillCell(_ movie: Movie, _ genre: String) {
        lbMovieTitle.text = movie.title
        lbReleaseDate.text = DateConfig().dateFormat(date: movie.releaseDate)
        lbGender.text = genre
        ivPoster.kf.setImage(with: URL(string: BASE_IMAGE_URL+movie.posterPath))
    }
}
