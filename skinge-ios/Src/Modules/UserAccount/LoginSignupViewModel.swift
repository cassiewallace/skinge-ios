//
//  LoginSignupViewModel.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 1/2/23.
//

import Foundation
import KeychainAccess

class LoginSignupViewModel: ObservableObject {

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
    
    func login(_ user: User) {
        dataStore.login(user) { (response: AccessToken?) in
            guard let accessToken = response?.key else {
                self.state = .failed
                return
            }
            self.dataStore.keychain["skinge-ios-access-token"] = accessToken
        }
    }
    
    func logout() {
        dataStore.logout()
    }
}
