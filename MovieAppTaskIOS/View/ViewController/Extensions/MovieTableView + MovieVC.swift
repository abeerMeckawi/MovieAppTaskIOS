//
//  MovieTableView + MovieVC.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 17/10/2021.
//

import UIKit

extension MovieViewController : UITableViewDelegate, UITableViewDataSource{
    
    func configureTableView(){
    
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as!
            MovieTableViewCell
        movieVM.congigureCell(cell: cell, indexPath: indexPath,movieList: movieList)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "MovieDetailsVC") as! DetailsViewController
        movieDetailsVC.movieDetails = movieList[indexPath.row]
        self.navigationController?.pushViewController(movieDetailsVC, animated: true)
              
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
        
    }

}
