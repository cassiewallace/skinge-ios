//
//  SetupsView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 1/19/23.
//

import SwiftUI

struct SetupsView: View {

    // MARK: - Public Variables
    
    @EnvironmentObject var userSettings: UserSettings
    @ObservedObject var viewModel = SetupsViewModel()

    // MARK: - Body
    
    var body: some View {
        NavigationView {
            switch viewModel.userLoginState {
            case .loggedIn: setups
            case .loggedOut: setupsLoggedOut
            }
        }
        .onAppear { viewModel.load(with: userSettings) }
    }
    
    var setups: some View {
        List(viewModel.setups, id: \.id) { setup in
            Text(setup.name)
        }
        .navigationBarTitle("Setups")
    }
    
    var setupsLoggedOut: some View {
        Text("You're logged out")
        .navigationBarTitle("Setups")
    }
    
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        SetupsView()
    }
}
