//
//  ProductListViewModel.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import Foundation

class ProductListViewModel: ObservableObject {

    // MARK: - Public Variables
    
    @Published var bindings = [SkiBinding]()
    @Published var boots = [Boot]()
    @Published var skis = [Ski]()
    @Published var skins = [Skin]()
    @Published var error = false

    // MARK: - Private Variables
    
    private var dataStore: DataStore?
    
    // MARK: Init(s)
    
    init() {
        self.dataStore = DataStore()
    }
    
    // MARK: - Public Functions
    
    func getProducts<T: Decodable>(productType: Constants.ProductType, completionHandler: @escaping ([T]) -> Void) {
    
        dataStore?.getProducts(productType) { (products: [T]?) in
            guard let products = products else {
                self.error = true
                return
            }
            DispatchQueue.main.async {
                completionHandler(products)
            }
        }
    }
    
    func getBindings() {
        getProducts(productType: Constants.ProductType.bindings) { bindings in
            self.bindings = bindings
        }
    }
    
    func getBoots() {
        getProducts(productType: Constants.ProductType.boots) { (boots: [Boot]) in
            self.boots = boots
        }
    }
    
    func getSkis() {
        getProducts(productType: Constants.ProductType.skis) { (skis: [Ski]) in
            self.skis = skis
        }
    }
    
    func getSkins() {
        getProducts(productType: Constants.ProductType.skins) { (skins: [Skin]) in
            self.skins = skins
        }
    }

}
