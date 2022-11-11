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
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                Image(systemName: "figure.skiing.downhill")
                        .resizable()
                        .frame(width: 300, height: 450)
                        .foregroundColor(.black)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray))
                Spacer()
                Text("\(ski.year) \(ski.brand.name)")
                Text(ski.name).font(.largeTitle).bold()
                tags
                Spacer()
                Text(ski.description ?? "")
                Spacer()
                HStack {
                    Text("Warranty:").bold()
                    Text(ski.warranty ?? "")
                }
            }
            .padding()
        }
        .navigationTitle(skiFullName)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    var tags: some View {
        HStack {
            Text(ski.recommendedUse ?? "").tagify(color: .blue)
            if ski.womensSpecific ?? false {
                Text("Womens Specific").tagify(color: .pink)
            } else {
            }
        }
    }
   
}
