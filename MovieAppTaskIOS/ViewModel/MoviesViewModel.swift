//
//  MoviesViewModel.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 16/10/2021.
//

import Foundation

class MoviesViewModel{
    
    var movieService = MovieNetworkLayer()
    
    var movieList :[Movie] = [] {
        didSet{self.bindMoviesViewModelToView()}}
    
    var showError : String! {didSet{self.bindViewModelErrorToView()}}
    
    var bindMoviesViewModelToView : (()->()) = {}
    var bindViewModelErrorToView : (()->()) = {}
    
    
    func fetchMovieDataFromAPI(movieTitle: String){
        
        movieService.fetchSearchMovies(movieTitle: movieTitle, completion: {
            (movies,error) in
            if let error = error{
                let message = error.localizedDescription
                self.showError = message
            }else{
                guard let moviesList = movies else {return}
                self.movieList = moviesList
            }
        })
    }
    
    func congigureCell(cell:MovieTableViewCell, indexPath:IndexPath,movieList: [Movie]) {
        let movie = movieList[indexPath.row]
        let handleMovie = HandleMovieData(movie: movie)
        cell.configureCell(movie: handleMovie)
    }

}
