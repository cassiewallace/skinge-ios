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
            List(skis, id: \.id) { ski in
                Text(ski.name)
            }
            .task {
                await loadSkis()
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
