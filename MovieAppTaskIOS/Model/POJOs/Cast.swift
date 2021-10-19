//
//  Cast.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 16/10/2021.
//

import Foundation

struct Cast : Codable {
    let adult : Bool?
    let gender : Int?
    let id : Int?
    let known_for_department : String?
    let name : String?
    let castName : String?
    let popularity : Double?
    let castImg : String?
    let cast_id : Int?
    let character : String?
    let credit_id : String?
    let order : Int?

    enum CodingKeys: String, CodingKey {

        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case known_for_department = "known_for_department"
        case name = "name"
        case castName = "original_name"
        case popularity = "popularity"
        case castImg = "profile_path"
        case cast_id = "cast_id"
        case character = "character"
        case credit_id = "credit_id"
        case order = "order"
    }


}
