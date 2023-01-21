//
//  SkiBindingVariant.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 12/28/22.
//

import Foundation

struct SkiBindingVariant: Codable {
    
    // MARK: - Variables
    
    var binding: SkiBinding?
    var size: String?
    var variationType: String?
    var brakeWidth: Int?
    var individualWeight: Int?
    var baseProduct: Bool
    var id: Int?
    
}
