//
//  Constants.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import Foundation

struct Constants {

    struct API {
        static let baseURL = "http://localhost:8080"
        static let productsPath = "/products"
        static let apiKey = "Bearer "
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
