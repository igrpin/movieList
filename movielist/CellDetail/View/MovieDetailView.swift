//
//  MoviewDetailView.swift
//  movielist
//
//  Created by Igor Pino de Souza on 06/01/23.
//

import Foundation
import UIKit


class MovieDetailView: UIView {
    
    private lazy var mainView: UIView = {
        let mainView = UIView()
        mainView.frame = CGRect(x: 0, y: 0, width: 40, height: 60)
        mainView.backgroundColor = .systemGray6
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
