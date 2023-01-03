//
//  GearView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 12/1/22.
//

import SwiftUI

struct GearView: View {

    // MARK: - Public Variables
    
    @State var selectedProductType = Constants.ProductType.skis
    
    // MARK: - Private Variables
    
    private let productTypes = Constants.ProductType.allCases
    
    // MARK: - Body

    var body: some View {
        NavigationView {
            VStack {
                Picker("Product Type", selection: $selectedProductType) {
                    ForEach(productTypes, id: \.self) { type in
                        Text(type.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                ProductListView(selectedProductType: $selectedProductType)
                Spacer()
            }
            .navigationBarTitle("Gear", displayMode: .inline)
        }
    }

}
