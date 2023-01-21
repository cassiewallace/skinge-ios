//
//  ContentView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 11/11/22.
//

import SwiftUI

struct ContentView: View {

    // MARK: - Public Variables
    
    @StateObject var userSettings = UserSettings()
    
    // MARK: - Body
    
    var body: some View {
        TabView() {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            GearView()
                .tabItem {
                    Image(systemName: "figure.skiing.downhill")
                    Text("Gear")
                }
            SetupsView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Setups")
                }
        }
        .environmentObject(userSettings)
    }
}
