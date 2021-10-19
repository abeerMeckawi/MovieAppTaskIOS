//
//  SearchBarExtensions + MovieVC.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 17/10/2021.
//

import UIKit

extension MovieViewController : UISearchBarDelegate{

    func configureSearchBar(){
        movieTableView.isHidden = true
        movieSearchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else{return}
        movieVM.fetchMovieDataFromAPI(movieTitle: searchText)
        movieVM.bindMoviesViewModelToView = {
            self.movieList = self.movieVM.movieList
            self.lblTextInfo.isHidden = true
            self.movieTableView.isHidden = false
            self.movieTableView.reloadData()
        }
    }
    
    func addLabel(){
        lblTextInfo = UILabel(frame: CGRect(x: 0, y: 0, width: 290, height: 36))
        lblTextInfo .center = CGPoint(x: 210, y: 460)
        lblTextInfo .textAlignment = .center
        lblTextInfo .lineBreakMode = .byWordWrapping
        lblTextInfo .font = lblTextInfo .font.withSize(30)
        lblTextInfo.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        lblTextInfo .text = "Search For Movie"
        self.view.addSubview(lblTextInfo )
    }
    
}

