//
//  skinge_iosApp.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import SwiftUI

@main
struct skinge_iosApp: App {
    private let skisList = SkisViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(skisList: skisList)
        }
    }
}
