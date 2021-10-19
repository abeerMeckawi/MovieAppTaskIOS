//
//  Genre.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 16/10/2021.
//

import Foundation

struct Genre : Codable {
    let id : Int?
    let genre : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case genre = "name"
    }
}
