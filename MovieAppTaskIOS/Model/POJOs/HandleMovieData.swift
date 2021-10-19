//
//  HandleMovieData.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 17/10/2021.
//

import Foundation

struct HandleMovieData {
    
    var imgBG: String?
    var genre : [Genre]?
    var movieTitle : String?
    var about : String?
    var imgPath: String?
    var date : String?
    var duration : Int?
    var rate : String = ""
    var videos : [VideoDetails]?
    var crew :[Crew] = []
    var cast : [Cast] = []
    
    
    
    init(movie: Movie?) {
        if let movie : Movie = movie{
            imgBG = movie.imgBG
            genre = movie.genres
            date = movie.date
            duration = movie.duration
            about = movie.about
            movieTitle = movie.movieTitle
            videos = movie.videos?.results
            if let background = movie.imgBG{imgBG = Constants.BASE_IMG_URL + background}
            if let path = movie.imgPath {imgPath = Constants.BASE_IMG_URL + path}
            if let rateValue = movie.rate, movie.rate ?? 1 > 0{rate = String(describing: rateValue)	.replacingOccurrences(of: ".", with: ",")}
            else{rate = "NR"}
            self.cast = movie.credits?.cast ?? []
            self.crew = movie.credits?.crew ?? []
        }
    }

    private func formateDate(date : String) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: date){
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.string(from: date)
        }
        return ""
    }
    
    private func formatMinutes(totalMinutes: Int) -> String {
        let h = totalMinutes / 60
        let m = totalMinutes - (h * 60)
        
        if(h == 0 && m == 0){
            return ""
        } else if(h == 0){
            return"\(m)m"
        } else {
            return "\(h)h \(m)m"
        }
    }
    
    func formateSubtitle(genre :String,duration: Int,date:String) -> String
    {
        let releaseDate : String
        let runtime : String
        releaseDate = formateDate(date: date)
        runtime = formatMinutes(totalMinutes: duration)
        
        return String(describing: genre).appending(" | ").appending(runtime).appending(" | ").appending(releaseDate)
    }
    
    
    func getVideoKey(videos : [VideoDetails]?) -> String {
        var videoKey = ""
        if let videoList = videos {
            for video in videoList {
                if let key = video.key, video.site == "YouTube" {
                    videoKey =  key
                    break
                }
            }
        }
        return videoKey
    }
    
    func formatCrew(crews: [Crew]?,firstJob:String,secondJob:String) -> CrewDetails{
        var jobs : [String] = []
        var name = ""
        if let crewList = crews{
            if let crew = crewList.first(where: {$0.job == firstJob || $0.job == secondJob}) {
                name = crew.crewName ?? ""
                let crewList = crewList.filter{$0.crewName == crew.crewName}
                for crewjobs in crewList{
                    jobs.append(crewjobs.job!)
                }
            }
        }
       
        return CrewDetails(name: name, job: jobs.joined(separator: ","))
    }
    
}
