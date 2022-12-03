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
    
    // MARK: - Private Variables
    
    private var getProducts: () {
        switch selectedProductType {
            case .bindings:
                return viewModel.getBindings()
            case .boots:
                return viewModel.getBoots()
            case .skis:
                return viewModel.getSkis()
            case .skins:
                return viewModel.getSkins()
            }
    }
    
    private var products: Array<Product> {
        switch selectedProductType {
            case .bindings:
                return viewModel.bindings
            case .boots:
                return viewModel.boots
            case .skis:
                return viewModel.skis
            case .skins:
                return viewModel.skins
            }
    }
    
    // MARK: - Body

    @ViewBuilder
    var body: some View {
        
        List(products, id: \.id) { product in
            // NavigationLink(destination: SkiDetailView(ski: product as! Ski )) {
                VStack(alignment: .leading) {
                    Text(product.brand)
                        .italic()
                    Text(product.name)
                        .font(.headline)
                }
            // }
        }
        .scrollContentBackground(.hidden)
        .frame(maxWidth: .infinity)
        .listStyle(PlainListStyle())
        .alert("Something went wrong", isPresented: $viewModel.error) {
            Button("OK") { }
        }
        .onAppear {
            getProducts
        }
        .onChange(of: selectedProductType) { _ in
            getProducts
        }
    }

}
