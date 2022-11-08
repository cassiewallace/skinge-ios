//
//  SkiListView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import SwiftUI

struct SkiListView: View {

    // MARK: - Public Variables
    
    @ObservedObject var skisList: SkisViewModel
    
    // MARK: - Body

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 8) {
                Text("Skis")
                    .font(.title)
                    .bold()
                    .padding()
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
            }
            .navigationBarTitle("Skinge", displayMode: .inline)
        }
        // .edgesIgnoringSafeArea(.all)
        .alert("Something went wrong", isPresented: $skisList.error) {
            Button("OK") { }
        }
    }

}

// MARK: Previews

struct SkiListView_Previews: PreviewProvider {
    static var previews: some View {
        let skisList = SkisViewModel()
        SkiListView(skisList: skisList)
    }
}