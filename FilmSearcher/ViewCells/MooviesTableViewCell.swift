//
//  MooviesTableViewCell.swift
//  FilmSearcher
//
//  Created by Tardes on 27/1/25.
//

import UIKit

class MooviesTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var TittleTextField: UILabel!
    @IBOutlet weak var YearTextField: UILabel!
    @IBOutlet weak var DurationTextField: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func render (moovie: Moovies) {
        TittleTextField.text = moovie.Title
        YearTextField.text = moovie.Year
        posterImageView.loadFrom(url: moovie.Poster)
        
    }

}
