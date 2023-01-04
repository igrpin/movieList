//
//  NoInternetConnectionMessageView.swift
//  movielist
//
//  Created by Igor Pino de Souza on 04/01/23.
//

import Foundation
import UIKit


class NoInternetConnectionMessageView: UIView {
    
    public lazy var mainStackViewVertical: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemRed
        stackView.clipsToBounds = true
        return stackView
    }()
    
    public lazy var lbPopularity: UILabel = {
        let lbMovieTitle = UILabel()
        lbMovieTitle.frame = .zero
        lbMovieTitle.text = "asdfasdfasdfasfasdfasdfasdfasdf"
        lbMovieTitle.textColor = .systemGray
        lbMovieTitle.font = .systemFont(ofSize: 18)
        lbMovieTitle.lineBreakMode = .byWordWrapping
        lbMovieTitle.numberOfLines = 0
        lbMovieTitle.clipsToBounds = true
        lbMovieTitle.adjustsFontSizeToFitWidth = true
        lbMovieTitle.layer.masksToBounds = false
        lbMovieTitle.backgroundColor = .systemRed
        lbMovieTitle.sizeToFit()
        lbMovieTitle.translatesAutoresizingMaskIntoConstraints = false
        
        return lbMovieTitle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        addSubview(lbPopularity)
//
//        lbPopularity.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        lbPopularity.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        lbPopularity.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        lbPopularity.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        lbPopularity.addArrangedSubview(lbPopularity)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewConstraints() {
        
    }
    
    
    //    private lazy var mainStackViewVertical: UIStackView = {
    //        let stackView = UIStackView()
    //        stackView.axis = .vertical
    //        stackView.spacing = 10
    //        stackView.alignment = .center
    //        stackView.distribution = .equalCentering
    //        stackView.translatesAutoresizingMaskIntoConstraints = false
    //        stackView.backgroundColor = .red
    //        stackView.clipsToBounds = true
    //        stackView.frame = bounds
    //        return stackView
    //    }()
    //
    //    private lazy var labelMessage: UILabel = {
    //        let message = UILabel(frame: .zero)
    //        message.text = "asdfadsfasdfasdf"
    //        return message
    //    }()
    //
    //    func presentView() {
    //
    //        configMainStackViewConstraints()
    //        mainStackViewVertical.addArrangedSubview(labelMessage)
    //        configLabelMesasageConstraints()
    //
    //        addSubview(mainStackViewVertical)
    //    }
    //
    //    func configMainStackViewConstraints() {
    //        mainStackViewVertical.leadingAnchor.constraint(equalTo: super.safeAreaLayoutGuide.leadingAnchor).isActive = true
    //        mainStackViewVertical.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    //        mainStackViewVertical.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    //        mainStackViewVertical.bottomAnchor.constraint(equalTo: super.bottomAnchor).isActive = true
    //    }
    //
    //    func configLabelMesasageConstraints() {
    //        labelMessage.leadingAnchor.constraint(equalTo: mainStackViewVertical.leadingAnchor, constant: -20).isActive = true
    //        labelMessage.trailingAnchor.constraint(equalTo: mainStackViewVertical.trailingAnchor, constant: -20).isActive = true
    //        labelMessage.topAnchor.constraint(equalTo: mainStackViewVertical.topAnchor, constant: -20).isActive = true
    //        labelMessage.bottomAnchor.constraint(equalTo: mainStackViewVertical.bottomAnchor, constant: -20).isActive = true
    //    }
}
