//
//  ViewController.swift
//  FilmSearcher
//
//  Created by Tardes on 27/1/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
 

    @IBOutlet weak var TableView: UITableView!
    
    
    var listMoovies : [Moovies] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        // Do any additional setup after loading the view.
        
        let searchController = UISearchController(searchResultsController: nil)
                searchController.searchBar.delegate = self
                navigationItem.searchController = searchController
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMoovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MooviesTableViewCell
        let moovie = listMoovies[indexPath.row]
        cell.render(moovie: moovie)
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let query = searchBar.text!
        
        if (query.isEmpty){
            searchBy(name: "a")
           
        } else {
            
            searchBy(name: query)}
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBy(name: "a")
    }
    
    func searchBy(name: String)
    {
        Task{
            
            do{
                listMoovies = try await MooviesProvider.SearchMoviesBy(name: name)
                
                DispatchQueue.main.async {
                    self.TableView.reloadData()
                }
                
            } catch{
                print(error)
            }
            
        }
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DetailView = segue.destination as! DetailViewController
        let index = TableView.indexPathForSelectedRow!
        DetailView.id = listMoovies[index.row].imdbID
        
        TableView.deselectRow(at: index, animated: true)
        let cell = tableView(TableView, cellForRowAt: index)
      
        
    }


}

