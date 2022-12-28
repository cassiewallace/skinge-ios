//
//  DataStore.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import Foundation

class DataStore {

    // MARK: - Class Methods
    // Retrieve all of a particular product.
    public func getProducts<T: Decodable>(_ productType: Constants.ProductType, completionHandler: @escaping ([T]?) -> Void) {
        
        let url = Constants.API.baseURL +
                    Constants.API.productsPath +
                    "/\(productType.rawValue)/"

        HTTPClient.get(url: url) { products in
            completionHandler(products)
            return
        }
    }
    
}
