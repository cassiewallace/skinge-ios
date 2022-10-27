//
//  ContentView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import SwiftUI

struct ContentView: View {
    @State private var skis = [Ski]()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 8) {
                Text("Skis")
                    .font(.title)
                    .bold()
                List(skis, id: \.id) { ski in
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
                .task {
                    await loadSkis()
                }
            }
            .navigationBarTitle("Skinge", displayMode: .inline)
        }
        .padding()
    }
    
    func loadSkis() async {
        DataStore.getSkis { skis in
            guard let skis = skis else {
                print("Something went wrong.")
                return
            }
            self.skis = skis
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
