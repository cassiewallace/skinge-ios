//
//  ContentView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import SwiftUI

struct ContentView: View {

    // MARK: - Public Variables
    
    @ObservedObject var skisList: SkisViewModel

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 8) {
                Text("Skis")
                    .font(.title)
                    .bold()
                List(skisList.skis, id: \.id) { ski in
                    VStack(alignment: .leading) {
                        Text(ski.brand.name)
                            .italic()
                        Text(ski.name)
                            .font(.headline)
                    }
                }
                .scrollContentBackground(.hidden)
                .frame(maxWidth: .infinity)
                .listStyle(SidebarListStyle())
                // .task {
                //     await skisList.skis
                // }
            }
            .navigationBarTitle("Skinge", displayMode: .inline)
        }
        .padding()
    }

}

// MARK: Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let skisList = SkisViewModel()
        ContentView(skisList: skisList)
    }
}
