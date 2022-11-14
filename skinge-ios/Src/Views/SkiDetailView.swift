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

    // MARK: - Body
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    AsyncImage(url: URL(string: "https://www.armadaskis.com/en-us/shop/media/catalog/product/R/A/RA0000338__91aab948895e1c08c12f64cdda1a78ac.png")) { image in
                            image.resizable()
                            } placeholder: {
                                Color.gray
                            }
                            .scaledToFit()
                            .frame(width: geo.size.width)
                    VStack(alignment: .leading, spacing: 5) {
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
            }
            .navigationTitle("Ski Details")
            .navigationBarTitleDisplayMode(.inline)
        }
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
