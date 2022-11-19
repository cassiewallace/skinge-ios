//
//  URLRequest+Extensions.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 11/19/22.
//

import Foundation

extension URLRequest {

    init?(urlString: String, httpMethod: HTTPMethod) {
        guard let url = URL(string: urlString) else { return nil }
        
        self.init(url: url)
        self.httpMethod = httpMethod.rawValue
        self.setValue(Constants.API.apiKey, forHTTPHeaderField: "Authorization")
    }
    
}
