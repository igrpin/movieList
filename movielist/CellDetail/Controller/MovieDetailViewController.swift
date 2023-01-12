//
//  CellDetailViewController.swift
//  movielist
//
//  Created by Igor Pino de Souza on 06/01/23.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movie: Movie?
    let movieDetailView = MovieDetailView(frame: .zero)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(movie ?? "No data")
        view.backgroundColor = .lightGray
        view.clipsToBounds = true
        view.addSubview(movieDetailView)
        
        print(view.frame.size.height)

        movieDetailView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        movieDetailView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        movieDetailView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        movieDetailView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        movieDetailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        configView()
    }
    
    func configView(){
        if let movie = self.movie {
            movieDetailView.configView(movie)
        }
    }
}
