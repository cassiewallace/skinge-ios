//
//  URLRequest+Extensions.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 11/19/22.
//

import Foundation
import KeychainAccess

extension URLRequest {

    init?(urlString: String, httpMethod: HTTPMethod) {
        guard let url = URL(string: urlString) else { return nil }
        let keychain = Keychain(service: "cassiewallace.skinge-ios")
        let accessToken = "Bearer " + (keychain["skinge-ios-access-token"] ?? Constants.API.apiKey)
        
        self.init(url: url)
        self.httpMethod = httpMethod.rawValue
        self.setValue(accessToken, forHTTPHeaderField: "Authorization")
    }
    
}
