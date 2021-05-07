//
//  MovieListTableViewController.swift
//  movielist
//
//  Created by Igor Pino de Souza on 04/05/21.
//

import UIKit

class MovieListTableViewController: UITableViewController {

    var movies = [Movie]()
    var genre = [Genre]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // loadMovies()
//        loadGenresIds()
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        TmdbAPI.loadMovies { (movies) in
            self.movies = movies
            self.tableView.reloadData()
        }
        
        TmdbAPI.loadGenresIds { (genres) in
            self.genre = genres
            self.tableView.reloadData()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextScreen = segue.destination as! MovieViewController
        let movie = movies[tableView.indexPathForSelectedRow!.row]
        let genreName = getGenre(self.genre, movies[tableView.indexPathForSelectedRow!.row].genreIDS)
        nextScreen.movie = movie
        nextScreen.genreName = genreName
        
    }
    
    
//    func loadMovies() {
//        let urlPrincipal = "https://api.themoviedb.org/3/movie/now_playing?api_key=f321a808e68611f41312aa8408531476"
//        DispatchQueue.main.async {
//            guard let url = URL(string: urlPrincipal),
//            let JSONdata = try? Data(contentsOf: url) else { return }
//            if let data = try? JSONDecoder().decode(results.self, from: JSONdata) {
//                self.movies = data.movies
//                self.tableView.reloadData()
//            } else {
//              print("Algo deu errado")
//            }
//          }
//    }
    
//    func loadGenresIds() {
//        let urlPrincipal = "https://api.themoviedb.org/3/genre/movie/list?api_key=f321a808e68611f41312aa8408531476&language=pt-BR"
//        DispatchQueue.main.async { [self] in
//            guard let url = URL(string: urlPrincipal),
//            let JSONdata = try? Data(contentsOf: url) else { return }
//            if let data = try? JSONDecoder().decode(genreArray.self, from: JSONdata) {
//                self.genre = data.genres
//                //self.getGenre(self.genre, self.movies[0].genreIDS)
//                self.tableView.reloadData()
//            } else {
//              print("Erro inesperado")
//            }
//          }
//    }
    
    func getGenre(_ genres: [Genre], _ movieGenreID: [Int]) -> String {
        var genreName: String?
        for i in genres {
            if i.id == movieGenreID[0] {
//                print(i.id, i.name, movieGenreID[0])
                genreName = i.name
            }
            
        }
        return genreName!
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        let movie = movies[indexPath.row]
        cell.fillCell(movie, self.getGenre(self.genre, movie.genreIDS))
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MovieListTableViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //loadMovies()
        //tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //loadMovies()
       // tableView.reloadData()
    }
}
