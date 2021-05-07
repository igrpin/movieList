//
//  MovieTableViewCell.swift
//  movielist
//
//  Created by Igor Pino de Souza on 06/05/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

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
        lbReleaseDate.text = movie.releaseDate
        lbGender.text = genre
    }
    
    
}
