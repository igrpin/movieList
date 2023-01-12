//
//  MoviewDetailView.swift
//  movielist
//
//  Created by Igor Pino de Souza on 06/01/23.
//

import Foundation
import UIKit


class MovieDetailView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = .zero
        scrollView.backgroundColor = .black
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configView(_ movie: Movie){
//        self.scrollView.addSubview(posterImageView)
        scrollView.addSubview(posterImageView)
        addSubview(scrollView)
        
        scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        configPosterImageView(movie.posterPath)
        setIvPosterConstraints()
    }
    
    func configPosterImageView(_ posterPath: String) {
        posterImageView.kf.setImage(with: URL(string: TmdbEndpoints.BASE_IMAGE_URL + posterPath))
        
    }
    
    func setIvPosterConstraints() {
//        posterImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        posterImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
//        posterImageView.centerYAnchor.constraint(equalTo: super.safeAreaLayoutGuide.heightAnchobbr).isActive = true
//        posterImageView.trailingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        posterImageView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -10).isActive = true
        posterImageView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
//        posterImageView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        posterImageView.heightAnchor.constraint(equalToConstant: self.frame.size.height/2).isActive = true
    }
}
