//
//  ProductsView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 12/1/22.
//

import SwiftUI

struct ProductsView: View {

    // typealias products = Constants.ProductType

    @State private var productType = "skis"
    
    // MARK: - Body

    var body: some View {
        NavigationView {
            VStack {
                Picker("Product Type", selection: $productType) {
                    Text("Skis").tag("skis")
                    Text("Bindings").tag("bindings")
                    Text("Boots").tag("boots")
                    Text("Skins").tag("skins")
                }
                .pickerStyle(.segmented)
                products
                Spacer()
            }
            .navigationBarTitle("Gear", displayMode: .inline)
        }
    }
    
    @ViewBuilder
    var products: some View {
        if productType == "skis" {
            SkiListView()
        } else {
            Text("Not here yet")
        }
    }

}
