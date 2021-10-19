//
//  DetailsViewController.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 16/10/2021.
//

import UIKit
import youtube_ios_player_helper

class DetailsViewController: UIViewController ,YTPlayerViewDelegate {
    

    @IBOutlet weak var imgBG: UIImageView!
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var lblDirectorName: UILabel!
    @IBOutlet weak var lblDirectorType: UILabel!
    @IBOutlet weak var lblWriterName: UILabel!
    @IBOutlet weak var lblWriterType: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var playerView : YTPlayerView!
    @IBOutlet weak var lblAbout: UILabel!
    @IBOutlet weak var castCollectionView: UICollectionView!
   
    var movieDetails :Movie?
    var movie : HandleMovieData?
    var detailsVM = DetailsViewModel()
    
    var handle : HandleMovieData?
    
    override func viewDidLoad() {
        
        guard let movie = movieDetails else {return}
        detailsVM.congigureData(movie: movie)
        self.movie = detailsVM.movie
        updateView()
        playerView.delegate = self
        configureCollectionView()
        imgMovie.addShadow()
        

    }
    
    func updateView()  {
        
        imgBG.sd_setImage(with: URL(string: movie?.imgBG ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        imgMovie.sd_setImage(with: URL(string: movie?.imgPath ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        lblMovieTitle.text = movie?.movieTitle
        lblRate.text = "\(movie?.rate ?? "") /10"
        lblSubtitle.text = movie?.formateSubtitle(genre: movie?.genre?.first?.genre ?? "", duration: movie?.duration ?? 0 , date: movie?.date ?? "")
        guard let key = movie?.getVideoKey(videos: movie?.videos) else{return}
        playerView.load(withVideoId:key, playerVars: ["playsinline" : 1] )
        lblAbout.text = movie?.about
        lblDirectorName.text = movie?.formatCrew(crews: movie?.crew,firstJob: "Director",secondJob: "ScreenPlay").name
        lblDirectorType.text = movie?.formatCrew(crews: movie?.crew,firstJob: "Director",secondJob: "ScreenPlay").job
        lblWriterName.text =   movie?.formatCrew(crews: movie?.crew,firstJob: "Writer",secondJob: "Story").name
        lblWriterType.text =  movie?.formatCrew(crews: movie?.crew,firstJob: "Writer",secondJob: "Story").job
    }
    
   /* func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }*/
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
