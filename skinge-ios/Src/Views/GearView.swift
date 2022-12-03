//
//  GearView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 12/1/22.
//

import SwiftUI

struct GearView: View {

    @ObservedObject var viewModel = ProductListViewModel()
    @State var selectedProductType = Constants.ProductType.skins
    
    // MARK: - Body

    var body: some View {
        NavigationView {
            VStack {
                Picker("Product Type", selection: $selectedProductType) {
                    ForEach(Constants.ProductType.allCases, id: \.self) { type in
                        Text(type.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                ProductListView(viewModel: viewModel, selectedProductType: $selectedProductType)
                Spacer()
            }
            .navigationBarTitle("Gear", displayMode: .inline)
        }
    }

}
