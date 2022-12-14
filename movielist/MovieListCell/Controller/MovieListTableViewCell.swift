//
//  MovieListTableViewCell.swift
//  movielist
//
//  Created by Igor Pino de Souza on 12/12/22.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    private lazy var stackView = UIStackView()
    
    private lazy var lbMovieTitle = UILabel()
    
    private lazy var lbReleaseDate: UILabel = {
        let lbReleaseDate = UILabel(frame: .zero)
        lbReleaseDate.translatesAutoresizingMaskIntoConstraints = false
        lbReleaseDate.layer.cornerRadius = 0
        return lbReleaseDate
    }()
    private lazy var lbGender: UILabel = {
        let lbGender = UILabel(frame: .zero)
        lbGender.translatesAutoresizingMaskIntoConstraints = false
        lbGender.layer.cornerRadius = 0
        return lbGender
    }()
    
    private lazy var ivPoster: UIImageView = {
        let ivPoster = UIImageView(frame: .zero)
        ivPoster.translatesAutoresizingMaskIntoConstraints = false
        ivPoster.layer.cornerRadius = 5
        return ivPoster
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func verticalStackView() {
        
    }
    
    func configLbMovieTitle() {
        lbMovieTitle.text = "Usuário"
        lbMovieTitle.textAlignment = .center
        lbMovieTitle.lineBreakMode = .byWordWrapping
        lbMovieTitle.backgroundColor =  .clear
        lbMovieTitle.textColor = .black
        lbMovieTitle.layer.cornerRadius = 0
        lbMovieTitle.layer.masksToBounds = true
        
        setLbMovieTitleConstraints()
    }
    
    func setLbMovieTitleConstraints() {
        lbMovieTitle.centerYAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.centerYAnchor, constant: 0).isActive = true
        lbMovieTitle.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
        lbMovieTitle.trailingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
//        lbMovieTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
        lbMovieTitle.adjustsFontSizeToFitWidth = true
    }
}
