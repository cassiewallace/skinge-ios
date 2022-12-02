//
//  ContentView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 11/11/22.
//

import SwiftUI

struct ContentView: View {

    // MARK: - Body
    
    var body: some View {
        TabView() {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            ProductsView()
                .tabItem {
                    Image(systemName: "figure.skiing.downhill")
                    Text("Gear")
                }
        }
    }
}
