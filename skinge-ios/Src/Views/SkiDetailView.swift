//
//  SkiDetailView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 11/8/22.
//

import SwiftUI

struct SkiDetailView: View {

    // MARK: - Variables
    
    var ski: Ski
    var skiFullName: String
    
    // MARK: Initializers
    
    init(ski: Ski) {
        self.ski = ski
        skiFullName = "\(ski.year) \(ski.brand.name) \(ski.name)"
    }

    // MARK: - Body
    
    var body: some View {
        VStack {
            Text(ski.year)
            Text(ski.brand.name)
            Text(ski.name)
            Text(ski.recommendedUse ?? "")
            Text(ski.warranty ?? "")
            Text(ski.womensSpecific ?? false ? "Women's Specific" : "")
        }
        .navigationTitle(skiFullName)
        .navigationBarTitleDisplayMode(.inline)
    }
   
}
