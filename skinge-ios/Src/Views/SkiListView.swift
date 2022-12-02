//
//  SkiListView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import SwiftUI

struct SkiListView: View {

    // MARK: - Public Variables
    
    @ObservedObject var viewModel = SkisListViewModel()
    
    // MARK: - Body

    var body: some View {
        NavigationView {
            List(viewModel.skis, id: \.id) { ski in
                NavigationLink(destination: SkiDetailView(ski: ski)) {
                    VStack(alignment: .leading) {
                        Text(ski.brand)
                            .italic()
                        Text(ski.name)
                            .font(.headline)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .frame(maxWidth: .infinity)
            .listStyle(PlainListStyle())
        }
        .alert("Something went wrong", isPresented: $viewModel.error) {
            Button("OK") { }
        }
        .onAppear {
            viewModel.getSkis()
        }
    }

}

// MARK: Previews

struct SkiListView_Previews: PreviewProvider {
    static var previews: some View {
        SkiListView()
    }
}
