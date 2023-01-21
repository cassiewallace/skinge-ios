//
//  SetupsViewModel.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 1/21/23.
//

import Foundation

class SetupsViewModel: ObservableObject {

    // MARK: - Private Variables
    
    private var dataStore = DataStore()
    @Published private(set) var state: Constants.State = .idle
    @Published private(set) var userLoginState: UserSettings.LoginState = .loggedOut
    
    // MARK: - Public Functions
    
    func load(with userSettings: UserSettings) {
        switch userSettings.userLoginState {
        case .loggedIn: userLoginState = .loggedIn
        case .loggedOut: userLoginState = .loggedOut
        }
    }

}
