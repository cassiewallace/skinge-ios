//
//  SkisViewModel.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import Foundation

class SkisViewModel: ObservableObject {

    // MARK: - Public Variables
    
    @Published var skis = [Ski]()
    
    // MARK: Init(s)
    
    init() {
        getSkis()
    }
    
    // MARK: - Public Functions
    
    func getSkis() {
        DataStore.getSkis { skis in
            guard let skis = skis else {
                print("Something went wrong.")
                return
            }
            DispatchQueue.main.async {
                self.skis = skis
            }
        }
        print(skis)
    }

}
