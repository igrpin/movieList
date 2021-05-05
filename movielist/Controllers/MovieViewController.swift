//
//  MovieViewController.swift
//  movielist
//
//  Created by Igor Pino de Souza on 04/05/21.
//

import UIKit

class MovieViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTest(_ sender: Any) {
    }
    
    
//    var movies = [Movie]()
//
//    func loadMovies() {
//        let urlPrincipal = "https://api.themoviedb.org/3/movie/now_playing?api_key=f321a808e68611f41312aa8408531476"
//        DispatchQueue.main.async {
//            guard let url = URL(string: urlPrincipal),
//            let JSONdata = try? Data(contentsOf: url) else { return }
//            if let data = try? JSONDecoder().decode(results.self, from: JSONdata) {
//                self.movies = data.movies
//                print(self.movies)
//                // self.tableView.reloadData()
//            } else {
//              print("Algo deu errado")
//            }
//          }
//
//    }

}
