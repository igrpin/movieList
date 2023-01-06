//
//  NoInternetConnectionMessageView.swift
//  movielist
//
//  Created by Igor Pino de Souza on 04/01/23.
//

import Foundation
import UIKit
import Kingfisher


class NoInternetConnectionMessageView: UIView {
    
    private lazy var btRetry: UIButton = {
        let btRetry = UIButton()
        btRetry.frame = CGRect(x: 0, y: 0, width: 350, height: 200)
        btRetry.setTitle("Retry", for: .normal)
        btRetry.setTitleColor(.secondaryLabel, for: .normal)
        btRetry.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btRetry.layer.cornerRadius = 0
        btRetry.layer.borderWidth = 0.3
        btRetry.layer.borderColor = UIColor.black.cgColor
        btRetry.contentEdgeInsets = UIEdgeInsets(top: 5, left: 7, bottom: 5, right: 7)
        return btRetry
    }()
    
    private lazy var ivNoConnection: UIImageView = {
        let customImageView = UIImageView()
        customImageView.image = UIImage(named: "654980")
        customImageView.contentMode = .scaleAspectFit
        customImageView.clipsToBounds = true
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        return customImageView
    }()
    
    private lazy var lbNoConnectionMessage: UILabel = {
        let customLabel = UILabel()
        customLabel.frame = .zero
        customLabel.text = "No Internet Connection"
        customLabel.textColor = .secondaryLabel
        customLabel.font = .systemFont(ofSize: 24)
        customLabel.lineBreakMode = .byWordWrapping
        customLabel.numberOfLines = 0
        customLabel.clipsToBounds = true
        customLabel.adjustsFontSizeToFitWidth = true
        customLabel.sizeToFit()
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        return customLabel
    }()
    
    private lazy var mainStackViewVertical: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = -10
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.clipsToBounds = true
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        mainStackViewVertical.addArrangedSubview(ivNoConnection)
        mainStackViewVertical.addArrangedSubview(lbNoConnectionMessage)
        mainStackViewVertical.addArrangedSubview(btRetry)
        addSubview(mainStackViewVertical)

        setMainStackViewVerticalConstraints()
        setIvNoConnectionConstraints()
        setLbNoConnectionMessageConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMainStackViewVerticalConstraints() {
        mainStackViewVertical.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mainStackViewVertical.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -80).isActive = true
    }
    
    func setLbNoConnectionMessageConstraints() {
        lbNoConnectionMessage.centerXAnchor.constraint(equalTo: mainStackViewVertical.centerXAnchor).isActive = true
    }
    
    func setIvNoConnectionConstraints() {
        let ivNoConnectionHeight = CGFloat(200)
        let ivNoConnectionWidth = ivNoConnectionHeight/2
        ivNoConnection.heightAnchor.constraint(equalToConstant: ivNoConnectionHeight).isActive = true
        ivNoConnection.widthAnchor.constraint(equalToConstant: ivNoConnectionWidth).isActive = true
    }
}
