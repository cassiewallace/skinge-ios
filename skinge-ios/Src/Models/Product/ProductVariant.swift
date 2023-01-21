//
//  ProductVariant.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 1/19/23.
//

import Foundation

protocol ProductVariant: Codable {

    // MARK: - Variables
    
    var individualWeight: Int? { get set }
    var baseProduct: Bool { get set }
    var id: Int { get set }
    
}
