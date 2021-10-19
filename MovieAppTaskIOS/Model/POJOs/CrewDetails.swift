//
//  CrewDetails.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 18/10/2021.
//

import Foundation

struct CrewDetails {
    
    var name : String?
    var job : String?
    
    
    init(name: String, job : String) {
        self.name = name
        self.job = job
    }
}
