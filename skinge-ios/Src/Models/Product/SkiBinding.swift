//
//  SkiBinding.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 12/2/22.
//

import Foundation

struct SkiBinding: Product, Codable {

    // MARK: - Variables
    
    var year: String
    var brand: String
    var name: String
    var description: String?
    var recommendedUse: String?
    var warranty: String?
    var womensSpecific: Bool?
    var variants: [SkiBindingVariant]?
    var id: Int
    
}
