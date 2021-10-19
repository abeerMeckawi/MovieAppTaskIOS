//
//  CastDetails.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 18/10/2021.
//

import Foundation

struct CastDetails {
    
    var castImg = ""
    
    init(cast : Cast) {
        if let img = cast.castImg{
            castImg = img
        }
    }
}
