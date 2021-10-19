//
//  MovieTableViewCell.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 16/10/2021.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    
    
    
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var lblMovieRate: UILabel!
    @IBOutlet weak var lblMovieSubtitle: UILabel!
    @IBOutlet weak var lblMovieAbout: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addGradientBackground(firstColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), secondColor: #colorLiteral(red: 0.231372549, green: 0.2352941176, blue: 0.2392156863, alpha: 1))
        imgMovie.addShadow()
    }
    
    func configureCell(movie: HandleMovieData) {
        guard let overview = movie.about?.split(separator: ".").first else {return}
        lblMovieTitle.text = movie.movieTitle
        lblMovieRate.text = movie.rate
        lblMovieAbout.text = "\(overview)"
        lblMovieSubtitle.text = movie.formateSubtitle(genre: movie.genre?.first?.genre ?? "", duration: movie.duration ?? 0 , date: movie.date ?? "")
        
        imgMovie.sd_setImage(with: URL(string: movie.imgPath ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        
    }
        
}
