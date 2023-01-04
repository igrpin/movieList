//
//  DefaultTableView.swift
//  movielist
//
//  Created by Igor Pino de Souza on 12/12/22.
//

import UIKit

class DefaultTableViewController: UITableViewController {
        
    var movies = [Movie]()
    var currentPage: Int = 1
    let network = CheckInternetConnection.shared
    
    override func viewDidLoad() {
        self.title = "Movie List"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: "defaultCell")
        tableView.delegate = self
        self.navigationController?.pushViewController(NoConnectionMessageViewController(), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if network.startMonitoring() {
            TmdbAPI.loadMoviesNowPlaying(currentPage, { [weak self] (data) in
                guard let self = self else { return }
                switch data {
                case .success(let data):
                    self.movies = data.movies
                    self.tableView.reloadData()
                case .failure(_):
                    print("Failed getting data from API")
                }
            })
        } else {
//            self.navigationController?.pushViewController(NoConnectionMessageViewController(), animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
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
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            executeActionAtTheEnd(of: scrollView)
        }
    }

    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        executeActionAtTheEnd(of: scrollView)
    }

    private func executeActionAtTheEnd(of scrollView: UIScrollView) {
        if scrollView.contentOffset.y + 1 >= (scrollView.contentSize.height - scrollView.frame.size.height) {
            self.currentPage += 1
            TmdbAPI.loadMoviesNowPlaying(self.currentPage, { [weak self] (data) in
                guard let self = self else { return }
                switch data {
                case .success(let data):
                    if (self.currentPage <= data.page) {
                        self.movies.append(contentsOf: data.movies)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                case .failure(_):
                    print("Failed getting data from API")
                }
            })
        }
    }
}
