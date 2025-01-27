//
//  DetailViewController.swift
//  FilmSearcher
//
//  Created by Tardes on 27/1/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    
    @IBOutlet weak var YearTextField: UILabel!
    @IBOutlet weak var DirectorTextField: UILabel!
    @IBOutlet weak var countryTextField: UILabel!
    @IBOutlet weak var genreTextField: UILabel!
    @IBOutlet weak var RuntimeTextField: UILabel!
    
    @IBOutlet weak var plotTextField: UILabel!
    var id : String!
    var movie: Moovies!
    override func viewDidLoad() {
        super.viewDidLoad()

        searchMovie()
        
        
        // Do any additional setup after loading the view.
    }
    

  
    func searchMovie()
    {
        Task{
            
            do{
                movie = try await MooviesProvider.SearchMovieById(id: self.id)
                DispatchQueue.main.async {
                    self.loadData()
                }
            } catch{
                print(error)
            }
        }
    }
    
    func loadData()
    {
        navigationItem.title = movie.Title
        posterImageView.loadFrom(url: movie.Poster)
        YearTextField.text = movie.Year
        RuntimeTextField.text = movie.RunTime
        DirectorTextField.text = movie.Director
        genreTextField.text = movie.Genre
        countryTextField.text = movie.Country
        plotTextField.text = movie.Plot
        
    }

}
