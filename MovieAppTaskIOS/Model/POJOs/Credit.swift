//
//  Credit.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 16/10/2021.
//

import Foundation

struct Credit : Codable {
    let cast : [Cast]?
    let crew : [Crew]?

    enum CodingKeys: String, CodingKey {

        case cast = "cast"
        case crew = "crew"
    }

}
