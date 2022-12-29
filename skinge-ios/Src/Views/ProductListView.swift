//
//  ProductListView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 12/2/22.
//

import SwiftUI

struct ProductListView: View {

    // MARK: - Public Variables
    
    @ObservedObject var viewModel: ProductListViewModel
    @Binding public var selectedProductType: Constants.ProductType
    
    // MARK: - Body

    var body: some View {
        switch viewModel.state {
        case .idle:
            Color.clear.onAppear { viewModel.load(with: selectedProductType) }
        case .loading:
            ProgressView()
                .frame(maxHeight: .infinity)
        case .failed:
            ErrorView()
        case .loaded:
            List(viewModel.products, id: \.id) { product in
                NavigationLink(destination: ProductDetailView(product: product, productType: selectedProductType)) {
                        VStack(alignment: .leading) {
                            Text(product.brand)
                                .italic()
                            Text(product.name)
                                .font(.headline)
                        }
                }
            }
            .listStyle(PlainListStyle())
            .scrollContentBackground(.hidden)
            .frame(maxWidth: .infinity)
            .onChange(of: selectedProductType) { _ in
                viewModel.load(with: selectedProductType)
            }
        }
    }

}
