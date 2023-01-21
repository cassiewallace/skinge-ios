//
//  Ski.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import Foundation

struct Ski: Product, Codable, Hashable {

    // MARK: - Typealiases
    typealias ProductVariant = SkiVariant
    
    // MARK: - Variables
    
    var year: String
    var brand: String
    var name: String
    var description: String?
    var recommendedUse: String?
    var warranty: String?
    var womensSpecific: Bool?
    var variants: Array<SkiVariant>?
    var id: Int
    
}
