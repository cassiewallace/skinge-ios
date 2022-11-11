//
//  SkiListView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import SwiftUI

struct SkiListView: View {

    // MARK: - Public Variables
    
    @ObservedObject var skisList = SkisListViewModel()
    
    // MARK: - Body

    var body: some View {
        NavigationView {
            List(skisList.skis, id: \.id) { ski in
                NavigationLink(destination: SkiDetailView(ski: ski)) {
                    VStack(alignment: .leading) {
                        Text(ski.brand.name)
                            .italic()
                        Text(ski.name)
                            .font(.headline)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .frame(maxWidth: .infinity)
            .listStyle(PlainListStyle())
            .navigationBarTitle("Skis", displayMode: .inline)
        }
        .alert("Something went wrong", isPresented: $skisList.error) {
            Button("OK") { }
        }
    }

}

// MARK: Previews

struct SkiListView_Previews: PreviewProvider {
    static var previews: some View {
        SkiListView()
    }
}
