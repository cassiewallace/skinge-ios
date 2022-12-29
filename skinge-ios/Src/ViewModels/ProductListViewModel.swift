//
//  ProductListViewModel.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import Foundation
import SwiftUI

class ProductListViewModel: ObservableObject {

    // MARK: - Public Variables
    
    @Published var bindings = [SkiBinding]()
    @Published var boots = [Boot]()
    @Published var skis = [Ski]()
    @Published var skins = [Skin]()
    var selectedProductType: Constants.ProductType = Constants.ProductType.skis
    
    var products: Array<Product> {
        switch selectedProductType {
            case .bindings:
                return bindings
            case .boots:
                return boots
            case .skis:
                return skis
            case .skins:
                return skins
            }
    }

    // MARK: - Private Variables
    
    private var dataStore: DataStore?
    @Published private(set) var state: Constants.State = .idle
    
    // MARK: Init(s)
    
    init() {
        self.dataStore = DataStore()
    }
    
    // MARK: - Public Functions
    
    func load(with selectedProductType: Constants.ProductType) {
        self.selectedProductType = selectedProductType
        
        switch selectedProductType {
        case .bindings:
            getBindings()
        case .boots:
            return getBoots()
        case .skis:
            return getSkis()
        case .skins:
            return getSkins()
        }
    }
    
    func getProducts<T: Decodable>(productType: Constants.ProductType, completionHandler: @escaping ([T]) -> Void) {
        state = .loading
    
        dataStore?.getProducts(productType) { (products: [T]?) in
            guard let products = products else {
                self.state = .failed
                return
            }
            DispatchQueue.main.async {
                completionHandler(products)
                self.state = .loaded
            }
        }
    }
    
    func getBindings() {
        getProducts(productType: Constants.ProductType.bindings) { bindings in
            self.bindings = bindings
        }
    }
    
    func getBoots() {
        getProducts(productType: Constants.ProductType.boots) { boots in
            self.boots = boots
        }
    }
    
    func getSkis() {
        getProducts(productType: Constants.ProductType.skis) { skis in
            self.skis = skis
        }
    }
    
    func getSkins() {
        getProducts(productType: Constants.ProductType.skins) { skins in
            self.skins = skins
        }
    }

}
