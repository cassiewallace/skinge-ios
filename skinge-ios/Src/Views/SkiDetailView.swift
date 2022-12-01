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
                    skiDetails
                    skiVariants
                }
            }
            .navigationTitle("Ski Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var skiDetails: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("\(ski.year) \(ski.brand)")
            Text(ski.name).font(.largeTitle).bold()
            tags
                .padding(.bottom)
            Text(ski.description ?? "")
                .padding(.bottom)
            HStack {
                Text("Warranty:").bold()
                Text(ski.warranty ?? "")
            }
        }
        .padding()
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
    
    var skiVariants: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Sizes")
                .font(.title3)
                .bold()
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Size")
                    Text("Turning Radius")
                    Text("Tip Width")
                    Text("Waist Width")
                    Text("Tail Width")
                    Text("Individual Weight")
                }
                .bold()
                ForEach(ski.variants, id: \.size) { variant in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(String(variant.size)).bold()
                        Text(variant.turningRadius ?? "")
                        Text(variant.tipWidth?.string ?? "")
                        Text(variant.waistWidth?.string ?? "")
                        Text(variant.tailWidth?.string ?? "")
                        Text(variant.individualWeight?.string ?? "")
                    }
                }
            }
        }
        .padding()
    }
   
}
