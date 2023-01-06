//
//  CellDetailViewController.swift
//  movielist
//
//  Created by Igor Pino de Souza on 06/01/23.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movie: Movie?
    let myView = MovieDetailView(frame: .zero)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(movie ?? "No data")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myView)
        
        myView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        myView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        myView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        myView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    //(82) 99634-8218 - Julius
}
