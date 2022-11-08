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
        VStack(alignment: .leading, spacing: 5) {
            Text("\(ski.year) \(ski.brand.name)")
            Text(ski.name).font(.largeTitle)
            Text(ski.recommendedUse ?? "")
                .font(.caption)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(5)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
            Text("Warranty: \(ski.warranty ?? "")")
            Text("Womens Specific: \(ski.womensSpecific ?? false ? "Yes" : "No")")
        }
        .navigationTitle(skiFullName)
        .navigationBarTitleDisplayMode(.inline)
    }
   
}
