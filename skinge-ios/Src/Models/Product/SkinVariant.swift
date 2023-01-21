//
//  SkinVariant.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 12/28/22.
//

import Foundation

struct SkinVariant: ProductVariant, Codable {

    // MARK: - Variables
    
    var skin: Skin?
    var size: String?
    var width: Int?
    var lengthMin: Int?
    var lengthMax: Int?
    var individualWeight: Int?
    var baseProduct: Bool
    var id: Int
    
}
