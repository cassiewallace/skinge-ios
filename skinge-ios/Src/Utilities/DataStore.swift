//
//  DataStore.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import Foundation
import KeychainAccess

class DataStore {

    // MARK: - Public Variables
    
    public let keychain = Keychain(service: "cassiewallace.skinge-ios")

    // MARK: - Public Methods
    
    /// Log in a user.
    /// - Parameters:
    ///   - user: The user's email and password.
    ///   - completionHandler: Function to run once the data has been retrieved.
    public func login(_ user: User, completionHandler: @escaping (AccessToken?) -> Void) {
        let url = Constants.API.baseURL + Constants.API.Authentication.login

        HTTPClient.post(url, data: user) { accessToken in
            completionHandler(accessToken)
            return
        }
    }
    
    /// Log out the current user.
    /// - Parameters:
    ///   - user: The user's email and password.
    ///   - completionHandler: Function to run once the data has been retrieved.
    public func logout() {
        keychain["skinge-ios-access-token"] = nil
    }
    
    /// Retrieve all of a particular product.
    /// - Parameters:
    ///   - productType: Category of product to retrieve.
    ///   - completionHandler: Function to run once the data has been retrieved.
    public func getProducts<T: Decodable>(_ productType: Constants.ProductType, completionHandler: @escaping ([T]?) -> Void) {
        let url = Constants.API.baseURL + Constants.API.productsPath +
                    "/\(productType.rawValue)/"

        HTTPClient.get(url) { products in
            completionHandler(products)
            return
        }
    }
    
    /// Retrieve all of the current user's setups.
    /// - Parameters:
    ///   - completionHandler: Function to run once the data has been retrieved.
    public func getSetups(completionHandler: @escaping ([Setup]?) -> Void) {
        let url = Constants.API.baseURL + Constants.API.User.setups

        HTTPClient.get(url) { setups in
            completionHandler(setups)
            return
        }
    }
}
