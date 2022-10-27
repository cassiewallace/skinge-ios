//
//  ContentView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Skis go here.")
            .navigationBarTitle("Skinge", displayMode: .inline)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
