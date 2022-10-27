//
//  Product.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import Foundation

protocol Product {

    // MARK: - Variables
    
    var year: String { get set }
    var brand: Brand { get set }
    var name: String { get set }
    var description: String { get set }
    var recommendedUse: String { get set }
    var warranty: String { get set }
    var id: Int { get set }
    
}
