//
//  Movie.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 16/10/2021.
//

import Foundation

struct Movie : Codable {
    let adult : Bool?
    let imgBG: String?
    let budget : Int?
    let genres : [Genre]?
    let homepage : String?
    let id : Int?
    let imdb_id : String?
    let original_language : String?
    let movieTitle : String?
    let about : String?
    let popularity : Double?
    let imgPath: String?
    let date : String?
    let revenue : Int?
    let duration : Int?
    let status : String?
    let tagline : String?
    let title : String?
    let video : Bool?
    let rate : Double?
    let vote_count : Int?
    let videos : Videos?
    let credits : Credit?

    enum CodingKeys: String, CodingKey {

        case adult = "adult"
        case imgBG = "backdrop_path"
        case budget = "budget"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case imdb_id = "imdb_id"
        case original_language = "original_language"
        case movieTitle = "original_title"
        case about = "overview"
        case popularity = "popularity"
        case imgPath = "poster_path"
        case date = "release_date"
        case revenue = "revenue"
        case duration = "runtime"
        case status = "status"
        case tagline = "tagline"
        case title = "title"
        case video = "video"
        case rate = "vote_average"
        case vote_count = "vote_count"
        case videos = "videos"
        case credits = "credits"
    }

}
