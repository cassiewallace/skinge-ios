//
//  BootVariant.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 12/28/22.
//

import Foundation

struct BootVariant: ProductVariant, Codable {
    
    // MARK: - Variables
    
    var boot: Boot?
    var mondoSize: Double?
    var lastWidth: Int?
    var bootSoleLength: Int?
    var individualWeight: Int?
    var baseProduct: Bool
    var id: Int
    
}
