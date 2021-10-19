//
//  URLBulder.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 16/10/2021.
//

import Foundation

class URLBuilder {
    
    private var urlComponents: URLComponents!
    private var parameters: [URLQueryItem] = []
    
    init(withBaseURL url: String, _ endpoint: String = "") {
        self.urlComponents = URLComponents(string: url + endpoint)
    }
    
    func addQueryItem(key: String, value: String) -> URLBuilder {
        parameters.append(URLQueryItem(name: key, value: value))
        return self
    }
    
    func addQueryItem(key: String, value: Int) -> URLBuilder {
        parameters.append(URLQueryItem(name: key, value: String(value)))
        return self
    }

    func build() -> URL {
        if !parameters.isEmpty {
            urlComponents.queryItems = parameters
        }
        
        return urlComponents.url!
    }
}
