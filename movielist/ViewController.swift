//
//  ViewController.swift
//  movielist
//
//  Created by Igor Pino de Souza on 04/05/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        TmdbAPI.loadMovies()
    }


}

