//
//  SkisViewModel.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import Foundation

class SkisViewModel: ObservableObject {
    @Published var skis = [Ski]()

    func getSkis() {
        DataStore.getSkis { skis in
            guard let skis = skis else {
                print("Something went wrong.")
                return
            }
            self.skis = skis
        }
        print(skis)
    }

}
