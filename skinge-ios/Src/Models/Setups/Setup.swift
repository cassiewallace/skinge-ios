//
//  Setup.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 1/19/23.
//

import Foundation

struct Setup: Decodable {

    // MARK: - Variables
    
    var name: String
    var totalWeight: Int
    var ski: SkiVariant?
    var binding: SkiBindingVariant?
    var boot: BootVariant?
    var skin: SkinVariant?
    var id: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case totalWeight
        case ski = "skiVariant"
        case binding = "bindingVariant"
        case boot = "bootVariant"
        case skin = "skinVariant"
        case id
    }
    
}
