//
//  Boot.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 12/2/22.
//

import Foundation

struct Boot: Product, Codable {

    // MARK: - Typealiases
    
    typealias ProductVariant = BootVariant    

    // MARK: - Variables
    
    var year: String
    var brand: String
    var name: String
    var description: String?
    var recommendedUse: String?
    var warranty: String?
    var womensSpecific: Bool?
    var variants: Array<ProductVariant>?
    var id: Int
    
}
