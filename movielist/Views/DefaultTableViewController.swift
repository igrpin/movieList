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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! MovieListTableViewCell
        cell.textLabel?.text = "\(movies[indexPath.row].title)"
        return cell
    }
}
