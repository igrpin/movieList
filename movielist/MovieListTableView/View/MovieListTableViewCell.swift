//
//  MovieListTableViewCell.swift
//  movielist
//
//  Created by Igor Pino de Souza on 12/12/22.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    private lazy var movieTitleVerticalStackView = UIStackView()
    private lazy var movieTitleHorizontalStackView = UIStackView()
    private lazy var lbMovieTitle = UILabel()
    private lazy var lbReleaseDate = UILabel()
    private lazy var lbPopularity = UILabel()
    private lazy var lbPopularityPlaceholder = UILabel()
    private lazy var lbReleaseDatePlaceHolder = UILabel()
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
        configLbReleaseDatePlaceholder()
        configLbPopularity(movie)
        configLbPopularityPlaceholder()
        
        configMovieTitleVerticalStackView()
        configMovieTitleHorizontalStackView()
        
        setIvPosterConstraints()
        setMovieTitleVerticalStackViewConstraints()
        setLbMovieTitleConstraints()
    }
    
    func configMovieTitleVerticalStackView() {
        movieTitleVerticalStackView.axis  = .vertical
        movieTitleVerticalStackView.distribution  = UIStackView.Distribution.equalSpacing
        movieTitleVerticalStackView.alignment = UIStackView.Alignment.leading
        movieTitleVerticalStackView.spacing   = 8.0
        movieTitleVerticalStackView.backgroundColor = .clear
        movieTitleVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        movieTitleVerticalStackView.addArrangedSubview(lbMovieTitle)
        movieTitleVerticalStackView.addArrangedSubview(movieTitleHorizontalStackView)
        
        contentView.addSubview(movieTitleVerticalStackView)
    }
    
    func setMovieTitleVerticalStackViewConstraints() {
        movieTitleVerticalStackView.leadingAnchor.constraint(equalTo: ivPoster.trailingAnchor, constant: 5).isActive = true
        movieTitleVerticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        movieTitleVerticalStackView.topAnchor.constraint(equalTo: ivPoster.topAnchor).isActive = true
    }
    
    func configMovieTitleHorizontalStackView() {
        movieTitleHorizontalStackView.axis  = .horizontal
        movieTitleHorizontalStackView.distribution  = UIStackView.Distribution.equalSpacing
        movieTitleHorizontalStackView.alignment = UIStackView.Alignment.leading
        movieTitleHorizontalStackView.spacing   = 2.0
        
        movieTitleHorizontalStackView.addArrangedSubview(lbReleaseDatePlaceHolder)
        movieTitleHorizontalStackView.addArrangedSubview(lbReleaseDate)
        
//        movieTitleHorizontalStackView.addArrangedSubview(lbPopularityPlaceholder)
//        movieTitleHorizontalStackView.addArrangedSubview(lbPopularity)
    }
    
    func configLbMovieTitle(_ movie: Movie) {
        lbMovieTitle.frame = .zero
        lbMovieTitle.text = movie.title
        lbMovieTitle.textColor = .label
        lbMovieTitle.font = .systemFont(ofSize: 18)
        lbMovieTitle.lineBreakMode = .byWordWrapping
        lbMovieTitle.numberOfLines = 0
        lbMovieTitle.clipsToBounds = true
        lbMovieTitle.adjustsFontSizeToFitWidth = true
        lbMovieTitle.layer.masksToBounds = false
        lbMovieTitle.backgroundColor = .clear
    }
    
    func setLbMovieTitleConstraints() {
        lbMovieTitle.translatesAutoresizingMaskIntoConstraints = false
        lbMovieTitle.leadingAnchor.constraint(equalTo: movieTitleVerticalStackView.leadingAnchor).isActive = true
        lbMovieTitle.widthAnchor.constraint(equalTo: movieTitleVerticalStackView.widthAnchor).isActive = true
    }
    
    func configLbReleaseDate(_ movie: Movie) {
        lbReleaseDate.frame = .zero
        lbReleaseDate.text = DateConfig().dateFormat(date: movie.releaseDate)
        lbReleaseDate.textColor = .secondaryLabel
        lbReleaseDate.font = lbReleaseDate.font.withSize(12)
        lbReleaseDate.lineBreakMode = .byClipping
        lbReleaseDate.textAlignment = .left
        lbMovieTitle.clipsToBounds = true
        lbReleaseDate.adjustsFontSizeToFitWidth = true
        lbReleaseDate.layer.masksToBounds = true
        lbReleaseDate.backgroundColor = .clear
    }
        
    func configLbReleaseDatePlaceholder() {
        lbReleaseDatePlaceHolder.frame = .zero
        lbReleaseDatePlaceHolder.text = "Release"
        lbReleaseDatePlaceHolder.textColor = .secondaryLabel
        lbReleaseDatePlaceHolder.font = lbReleaseDate.font
        lbReleaseDatePlaceHolder.lineBreakMode = .byClipping
        lbReleaseDatePlaceHolder.adjustsFontSizeToFitWidth = true
        lbReleaseDatePlaceHolder.layer.masksToBounds = false
        lbReleaseDatePlaceHolder.backgroundColor = .clear
    }
    
    func configLbPopularity(_ movie: Movie) {
        lbPopularity.frame = .zero
        lbPopularity.text = String(movie.popularity)
        lbPopularity.textColor = .label
        lbPopularity.font = .systemFont(ofSize: 12)
        lbPopularity.adjustsFontSizeToFitWidth = true
        lbPopularity.layer.masksToBounds = false
        lbPopularity.backgroundColor = .clear
    }
    
    func configLbPopularityPlaceholder() {
        lbPopularityPlaceholder.frame = .zero
        lbPopularityPlaceholder.text = "Popularity"
        lbPopularityPlaceholder.textColor = .black
        lbPopularityPlaceholder.font = lbPopularity.font
        lbPopularityPlaceholder.adjustsFontSizeToFitWidth = true
        lbPopularityPlaceholder.layer.masksToBounds = false
        lbPopularityPlaceholder.backgroundColor = .clear
    }
    
    func configIvPoster(_ movie: Movie) {
        ivPoster.kf.setImage(with: URL(string: BASE_IMAGE_URL+movie.posterPath))
        ivPoster.contentMode = .scaleAspectFit
        ivPoster.frame = .zero
        ivPoster.sizeToFit()
        ivPoster.layer.cornerRadius = 2
        ivPoster.layer.masksToBounds = true
        ivPoster.backgroundColor = .clear

        contentView.addSubview(ivPoster)
    }
    
    func setIvPosterConstraints() {
        ivPoster.translatesAutoresizingMaskIntoConstraints = false
        ivPoster.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        ivPoster.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -10).isActive = true
        ivPoster.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        ivPoster.widthAnchor.constraint(equalToConstant: 90).isActive = true
    }
}
