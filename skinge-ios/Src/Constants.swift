//
//  Constants.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import Foundation

struct Constants {

    struct API {
        static let baseURL = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "")"
        static let apiKey = "\(Bundle.main.infoDictionary?["API_KEY"] ?? "")"
        static let productsPath = "/products"
        
        struct Authentication {
            static let login = "/auth/login/"
            static let signup = "/auth/signup/"
        }
        
        struct User {
            static let setups = "/user/setups/"
        }
        
    }
    
    enum ProductType: String, CaseIterable {
        case skis
        case bindings
        case boots
        case skins
        
        func singularRawValue() -> String {
            return rawValue.dropLast(1).capitalized
        }
        
    }

    enum State {
        case idle
        case loading
        case loaded
        case failed
    }

}
