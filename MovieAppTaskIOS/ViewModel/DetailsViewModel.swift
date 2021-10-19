//
//  DetailsViewModel.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 18/10/2021.
//

import Foundation

class DetailsViewModel {

    var movie : HandleMovieData?
        
    func congigureData(movie: Movie) {
        self.movie = HandleMovieData(movie: movie)
    }
    
    func congigureCell(cell:CollectionViewCell, indexPath:IndexPath,cast: [Cast]) {
        if let cast = movie?.cast[indexPath.row]{
            let castData = CastDetails(cast: cast)
            cell.configureCell(cast: castData)
        }
    }
}
