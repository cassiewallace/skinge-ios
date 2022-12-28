//
//  ProductDetailView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 11/8/22.
//

import SwiftUI

struct ProductDetailView: View {

    // MARK: - Variables
    
    var product: any Product
    var productType: Constants.ProductType

    // MARK: - Body
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    // TODO: Remove placeholder image and implement images.
                    AsyncImage(url: URL(string: "https://www.armadaskis.com/en-us/shop/media/catalog/product/R/A/RA0000338__91aab948895e1c08c12f64cdda1a78ac.png")) { image in
                            image.resizable()
                            } placeholder: {
                                Color.gray
                            }
                            .scaledToFit()
                            .frame(width: geo.size.width)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(product.year) \(product.brand)")
                        Text(product.name).font(.largeTitle).bold()
                        tags
                            .padding(.bottom)
                        Text(product.description ?? "")
                            .padding(.bottom)
                        HStack {
                            Text("Warranty:").bold()
                            Text(product.warranty ?? "Unknown")
                        }
                    }
                    .padding()
                    if productType == Constants.ProductType.skis {
                        SkiVariants(ski: product as! Ski)
                    }
                }
            }
        }
        .navigationTitle("\(productType.rawValue.dropLast(1).capitalized) Details")
        // TODO: Maybe this should be handled in the ViewModel or Enum.
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    var tags: some View {
        HStack {
            if product.recommendedUse != "" {
                Text(product.recommendedUse ?? "").tagify(color: .blue)
            }
            if product.womensSpecific ?? false {
                Text("Womens Specific").tagify(color: .pink)
            }
        }
    }
   
}
