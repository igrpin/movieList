//
//  MoviewDetailView.swift
//  movielist
//
//  Created by Igor Pino de Souza on 06/01/23.
//

import Foundation
import UIKit
import SwiftUI


class MovieDetailView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = .zero
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: self.frame.size.width, height: 900)
        return scrollView
    }()
    
    private lazy var movieTitle: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 36)
        label.numberOfLines = 0
        label.contentMode = .scaleToFill
        label.textAlignment = .center
        label.sizeToFit()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var posterImageView: UIImageView = {
        let posterImageView = UIImageView()
        posterImageView.contentMode = .scaleAspectFit
        posterImageView.frame = .zero
        posterImageView.sizeToFit()
        posterImageView.layer.cornerRadius = 0
        posterImageView.layer.masksToBounds = true
        posterImageView.backgroundColor = .clear
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        return posterImageView
    }()
    
    private lazy var overviewTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Overview"
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.textColor = .secondaryLabel
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var overviewTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .justified
        label.sizeToFit()
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var moreDetailsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.clipsToBounds = true
        return stackView
    }()
    
    private lazy var releaseDateTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Release date"
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.sizeToFit()
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var releaseDateTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .justified
        label.sizeToFit()
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configView(_ movie: Movie){
        scrollView.addSubview(movieTitle)
        scrollView.addSubview(posterImageView)
        scrollView.addSubview(overviewTitleLabel)
        scrollView.addSubview(overviewTextLabel)
        scrollView.addSubview(moreDetailsStackView)
        addSubview(scrollView)
        
        setScrollViewConstraints()
        
        configMovieTitleLabel(title: movie.title)
        setMovieTitleLabelConstraints()
        
        configPosterImageView(posterPath: movie.posterPath)
        setIvPosterConstraints()
        
        setOverviewTitleLabelConstraints()
        
        configOverviewTextLabel(overview: movie.overview)
        setOverviewTextLabelConstraints()
        
        configMoreDetailsStackView()
        setMoreDetailsStackViewContraints()
        
        configReleaseDateTextLabel(date: movie.releaseDate)
    }
    
    func setScrollViewConstraints(){
        scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func configMovieTitleLabel(title: String){
        movieTitle.text = title
    }
    
    func setMovieTitleLabelConstraints(){
        movieTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        movieTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        movieTitle.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        
    }
    
    func configPosterImageView(posterPath: String) {
        posterImageView.kf.setImage(with: URL(string: TmdbEndpoints.BASE_IMAGE_URL + posterPath))
    }
    
    func setIvPosterConstraints() {
        posterImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        posterImageView.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 25).isActive = true
        posterImageView.heightAnchor.constraint(equalToConstant: self.frame.size.height/2).isActive = true
    }
    
    func setOverviewTitleLabelConstraints(){
        overviewTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        overviewTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        overviewTitleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 25).isActive = true
    }
    
    func configOverviewTextLabel(overview: String){
        overviewTextLabel.text = overview
    }
    
    func setOverviewTextLabelConstraints(){
        overviewTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        overviewTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        overviewTextLabel.topAnchor.constraint(equalTo: overviewTitleLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    func configMoreDetailsStackView(){
        moreDetailsStackView.addArrangedSubview(releaseDateTitleLabel)
        moreDetailsStackView.addArrangedSubview(releaseDateTextLabel)
    }
    
    func setMoreDetailsStackViewContraints(){
        moreDetailsStackView.topAnchor.constraint(equalTo: overviewTextLabel.bottomAnchor, constant: 30).isActive = true
        moreDetailsStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    }
    
    func configReleaseDateTextLabel(date: String) {
        releaseDateTextLabel.text = DateConfig().dateFormat(date: date)
    }
}
