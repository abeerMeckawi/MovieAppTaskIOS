//
//  MovieNetworkModel.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 16/10/2021.
//

import Foundation
import Alamofire

class MovieNetworkLayer{
    
    
    func fetchSearchMovies(movieTitle : String,completion:@escaping ([Movie]?, NSError?) -> Void) {
        var list = [Movie]()
        let url: String = URLBuilder(withBaseURL: Constants.BASE_URL , Constants.SEARCH_MOVIES)
            .addQueryItem(key:"api_key", value: Constants.API_KEY)
            .addQueryItem(key: "query", value: movieTitle)
            .build().absoluteString
        
        BaseMovieAPI.fetchData(url: url, responseClass: SearchMovieResponse.self) { [weak self] (response) in
            guard let self = self else { return }
            switch(response){
            case .success(let data):
                guard let data = data else { return }
                guard let movies = data.movies else { return }
                
                for movie in movies {
                    if let movieID = movie.id, !(movie.id == nil){
                        self.getMovie(movieID: movieID){ response in
                            switch(response){
                            case .success(let movie):
                                guard let movie = movie else { return }
                                list.append(movie)
                                if list.count == movies.count {
                                    completion(list,nil)
                                }
                            case .failure(let error):
                                print(error)
                            }
                        }
                    }
                }
                
            case .failure(let error):
                completion(nil,error)
            }
        }
    }
    
    
    func getMovie(movieID: Int,completion:@escaping (Result<Movie?,NSError>)->()){
        let url: String = URLBuilder(withBaseURL: Constants.BASE_URL, Constants.DETAILS_MOVIE + String(describing: movieID))
            .addQueryItem(key: "api_key", value : Constants.API_KEY)
            .addQueryItem(key: "append_to_response", value : "videos,credits")
            .build().absoluteString
        BaseMovieAPI.fetchData(url: url, responseClass: Movie.self) { result in
            switch(result){
            case.success(let movie):
                guard let movie = movie else { return }
                completion(.success(movie))
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
    
}
