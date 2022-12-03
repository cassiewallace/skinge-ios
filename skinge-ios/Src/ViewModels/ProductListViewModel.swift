//
//  ProductListViewModel.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import Foundation

class ProductListViewModel: ObservableObject {

    // MARK: - Public Variables
    
    // @Published var products = []
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
    
    // func getProducts<T: Decodable>(productType: Constants.ProductType, model: [T]?) {
    // 
    //     dataStore?.getProducts(productType) { (products: [T]?) in
    //         guard let products = products else {
    //             self.error = true
    //             return
    //         }
    //         DispatchQueue.main.async {
    //             self.products = products
    //         }
    //     }
    // }
    
    
    func getBindings() {
    
        dataStore?.getProducts(Constants.ProductType.bindings) { (bindings: [SkiBinding]?) in
            guard let bindings = bindings else {
                self.error = true
                return
            }
            DispatchQueue.main.async {
                self.bindings = bindings
            }
        }
    }
    
    func getBoots() {
    
        dataStore?.getProducts(Constants.ProductType.boots) { (boots: [Boot]?) in
            guard let boots = boots else {
                self.error = true
                return
            }
            DispatchQueue.main.async {
                self.boots = boots
            }
        }
    }
    
    func getSkis() {
    
        dataStore?.getProducts(Constants.ProductType.skis) { (skis: [Ski]?) in
            guard let skis = skis else {
                self.error = true
                return
            }
            DispatchQueue.main.async {
                self.skis = skis
            }
        }
    }
    
    func getSkins() {
    
        dataStore?.getProducts(Constants.ProductType.skins) { (skins: [Skin]?) in
            guard let skins = skins else {
                self.error = true
                return
            }
            DispatchQueue.main.async {
                self.skins = skins
            }
        }
    }

}
