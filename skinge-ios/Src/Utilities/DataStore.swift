//
//  DataStore.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import Foundation

class DataStore {

    // MARK: - Class Methods
    // Retrieve all skis.
    public func getSkis(completionHandler: @escaping ([Ski]?) -> Void) {
        let skisURL = Constants.API.baseURL +
                    Constants.API.productsPath +
                    Constants.API.skisPath

        HTTPClient.get(url: skisURL) { skis in
            completionHandler(skis)
            return
        }
    }
    
}
