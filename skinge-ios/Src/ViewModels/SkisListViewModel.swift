//
//  SkisListViewModel.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import Foundation

class SkisListViewModel: ObservableObject {

    // MARK: - Public Variables
    
    @Published var skis = [Ski]()
    @Published var error = false

    // MARK: - Private Variables
    
    private var dataStore: DataStore?
    
    // MARK: Init(s)
    
    init() {
        self.dataStore = DataStore()
    }
    
    // MARK: - Public Functions
    
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

}
