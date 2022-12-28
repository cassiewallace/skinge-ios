//
//  SkiVariant.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import Foundation

struct SkiVariant: ProductVariant, Codable, Hashable {

    // MARK: - Variables
    
    var size: Int
    var tipWidth: Float?
    var waistWidth: Float?
    var tailWidth: Float?
    var individualWeight: Int?
    var turningRadius: String?
    
}
