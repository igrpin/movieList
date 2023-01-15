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
    private lazy var lbVoteAverage = UILabel()
    private lazy var lbPopularity = UILabel()
    private lazy var lbPopularityPlaceholder = UILabel()
    private lazy var lbVoteAveragePlaceHolder = UILabel()
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
        configLbVoteAverage(movie)
        configLbMovieTitle(movie)
        configLbVoteAveragePlaceholder()
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
        
        movieTitleHorizontalStackView.addArrangedSubview(lbVoteAveragePlaceHolder)
        movieTitleHorizontalStackView.addArrangedSubview(lbVoteAverage)
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
    
    func configLbVoteAverage(_ movie: Movie) {
        lbVoteAverage.frame = .zero
        lbVoteAverage.text = String(movie.voteAverage)
        lbVoteAverage.textColor = .secondaryLabel
        lbVoteAverage.font = lbVoteAverage.font.withSize(12)
        lbVoteAverage.lineBreakMode = .byClipping
        lbVoteAverage.textAlignment = .left
        lbVoteAverage.adjustsFontSizeToFitWidth = true
        lbVoteAverage.layer.masksToBounds = true
        lbVoteAverage.backgroundColor = .clear
    }
        
    func configLbVoteAveragePlaceholder() {
        lbVoteAveragePlaceHolder.frame = .zero
        lbVoteAveragePlaceHolder.text = "Vote average"
        lbVoteAveragePlaceHolder.textColor = .secondaryLabel
        lbVoteAveragePlaceHolder.font = lbVoteAverage.font
        lbVoteAveragePlaceHolder.lineBreakMode = .byClipping
        lbVoteAveragePlaceHolder.adjustsFontSizeToFitWidth = true
        lbVoteAveragePlaceHolder.layer.masksToBounds = false
        lbVoteAveragePlaceHolder.backgroundColor = .clear
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
        ivPoster.kf.setImage(with: URL(string: TmdbEndpoints.BASE_IMAGE_URL+movie.posterPath))
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
