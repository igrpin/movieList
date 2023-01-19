//
//  DefaultTableView.swift
//  movielist
//
//  Created by Igor Pino de Souza on 12/12/22.
//

import UIKit

class RootTableViewController: UITableViewController, UINavigationControllerDelegate ,UIGestureRecognizerDelegate {
        
    var movies = [Movie]()
    var currentPage: Int = 1
    let network = CheckInternetConnection.shared
    
    override func viewDidLoad() {
        self.title = "Movie List"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: "defaultCell")
        tableView.delegate = self
        validateNetworkAndFetchData()
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
        cell.accessoryType = .disclosureIndicator
        view.addSubview(cell)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellDetailViewController = MovieDetailViewController()
        cellDetailViewController.movie = movies[tableView.indexPathForSelectedRow!.row]
        navigationController?.pushViewController(cellDetailViewController, animated: true)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        let enable = self.navigationController?.viewControllers.count ?? 0 > 1
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = enable
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
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
            validateNetworkAndFetchData()
        }
    }
    
    private func validateNetworkAndFetchData() {
        if network.isConnected {
            fetchData()
        } else {
            self.navigationController?.pushViewController(NoConnectionMessageViewController(), animated: true)
        }
    }
    
    private func fetchData() {
        TmdbAPI.loadMoviesNowPlaying(self.currentPage, { [weak self] (data) in
            guard let self = self else { return }
            switch data {
            case .success(let data):
                if (self.currentPage <= 1) {
                    self.movies = data.movies
                } else {
                    self.movies.append(contentsOf: data.movies)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(_):
                print("Failed getting data from API")
            }
        })
        self.currentPage += 1
    }
}
