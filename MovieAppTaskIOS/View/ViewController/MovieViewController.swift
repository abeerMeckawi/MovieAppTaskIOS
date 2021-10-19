//
//  ViewController.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 16/10/2021.
//

import UIKit

class MovieViewController: UIViewController{

    var movieVM = MoviesViewModel()
    var movieList = [Movie]()
    
    var lblTextInfo : UILabel!
    @IBOutlet weak var movieSearchBar: UISearchBar!
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet var moviesView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLabel()
        configureSearchBar()
        configureTableView()
        addAlert()
        moviesView.addGradientBackground(firstColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), secondColor: #colorLiteral(red: 0.231372549, green: 0.2352941176, blue: 0.2392156863, alpha: 1))
        
    }
   
    private func addAlert(){
        movieVM.bindMoviesViewModelToView = {
            let alertController = UIAlertController(title: "Alert", message:self.movieVM.showError, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK",style: .default))
            alertController.view.layoutIfNeeded()
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}


