//
//  User.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 1/2/23.
//

import Foundation

struct User: Encodable {

    // MARK: - Enumerations

    enum LoginState: Codable {
        case loggedIn
        case loggedOut
    }

    // MARK: - Variables
    
    var email: String
    var password: String
    
}
