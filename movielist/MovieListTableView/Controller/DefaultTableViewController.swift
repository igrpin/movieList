//
//  DefaultTableView.swift
//  movielist
//
//  Created by Igor Pino de Souza on 12/12/22.
//

import UIKit

class DefaultTableViewController: UITableViewController {
        
    var movies = [Movie]()
    
    override func viewDidLoad() {
        self.title = "Movie List"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: "defaultCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        TmdbAPI.loadMoviesNowPlaying { [weak self] (movies) in
            guard let self = self else { return }
            self.movies = movies
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count // set to value needed
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! MovieListTableViewCell
        cell.configCell(movies[indexPath.row])
        view.addSubview(cell)
        return cell
    }
}
