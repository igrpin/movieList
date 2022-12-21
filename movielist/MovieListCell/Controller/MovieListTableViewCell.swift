//
//  MovieListTableViewCell.swift
//  movielist
//
//  Created by Igor Pino de Souza on 12/12/22.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    private lazy var lbMovieTitle = UILabel()
    private lazy var lbReleaseDate = UILabel()
    private lazy var lbGender = UILabel()
    private lazy var ivPoster = UIImageView()
    
    let BASE_IMAGE_URL = "https://image.tmdb.org/t/p/original"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(_ movie: Movie) {
        configIvPoster(movie)
        configLbReleaseDate(movie)
        configLbMovieTitle(movie)
        
        setIvPosterConstraints()
        setLbReleaseDateConstraints()
        setLbMovieTitleConstraints()
    }
    
    func configLbMovieTitle(_ movie: Movie) {
        lbMovieTitle.frame = .zero
        
        lbMovieTitle.text = movie.title
        lbMovieTitle.textAlignment = .center
        lbMovieTitle.textColor = .black
        lbMovieTitle.lineBreakMode = .byWordWrapping
        lbMovieTitle.numberOfLines = 0
        lbMovieTitle.adjustsFontSizeToFitWidth = true
        lbMovieTitle.font = lbMovieTitle.font.withSize(20)
        
        lbMovieTitle.layer.cornerRadius = 0
        lbMovieTitle.layer.masksToBounds = false
        
        lbMovieTitle.backgroundColor = .red
        
        contentView.addSubview(lbMovieTitle)
    }
    
    func setLbMovieTitleConstraints() {
        lbMovieTitle.translatesAutoresizingMaskIntoConstraints = false
        lbMovieTitle.leadingAnchor.constraint(equalTo: ivPoster.trailingAnchor, constant: 5).isActive = true
        lbMovieTitle.trailingAnchor.constraint(equalTo: lbReleaseDate.leadingAnchor).isActive = true
        lbMovieTitle.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }
    
    func configLbReleaseDate(_ movie: Movie) {
        lbReleaseDate.text = DateConfig().dateFormat(date: movie.releaseDate)
        lbReleaseDate.frame = .zero
        lbReleaseDate.text = DateConfig().dateFormat(date: movie.releaseDate)
        lbReleaseDate.textAlignment = .left
        lbReleaseDate.textColor = .black
//        lbReleaseDate.lineBreakMode = .byClipping
        lbReleaseDate.adjustsFontSizeToFitWidth = true
        lbReleaseDate.layer.cornerRadius = 0
        lbReleaseDate.layer.masksToBounds = true
        lbReleaseDate.backgroundColor = .lightGray
        
        contentView.addSubview(lbReleaseDate)
        
    }
    
    func setLbReleaseDateConstraints() {
        lbReleaseDate.translatesAutoresizingMaskIntoConstraints = false
        lbReleaseDate.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        lbReleaseDate.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }
    
    func configIvPoster(_ movie: Movie) {
        ivPoster.kf.setImage(with: URL(string: BASE_IMAGE_URL+movie.posterPath))
        
        ivPoster.frame = .zero
        ivPoster.sizeToFit()
        ivPoster.layer.cornerRadius = 2
        ivPoster.layer.masksToBounds = true
        ivPoster.backgroundColor = .lightGray

        contentView.addSubview(ivPoster)
    }
    
    func setIvPosterConstraints() {
        ivPoster.translatesAutoresizingMaskIntoConstraints = false
        ivPoster.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        ivPoster.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -10).isActive = true
        ivPoster.widthAnchor.constraint(equalToConstant: 90).isActive = true
    }
}
