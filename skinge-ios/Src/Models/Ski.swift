//
//  Ski.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import Foundation

struct Ski: Product, Codable {

    // MARK: - Variables
    
    var year: String
    var brand: Brand
    var name: String
    var description: String?
    var recommendedUse: String?
    var warranty: String?
    var womensSpecific: Bool?
    var id: Int
    // var variants: [SkiVariant]
    
}
