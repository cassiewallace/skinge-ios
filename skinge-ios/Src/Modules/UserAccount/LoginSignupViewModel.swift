//
//  LoginSignupViewModel.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 1/2/23.
//

import Foundation
import KeychainAccess

class LoginSignupViewModel: ObservableObject {
    
    // MARK: - Public Variables
    public let keychain = Keychain(service: "cassiewallace.skinge-ios")
    @Published var userLoginState: User.LoginState

    // MARK: - Private Variables
    
    private var dataStore: DataStore?
    @Published private(set) var state: Constants.State = .idle
    
    // MARK: Init(s)
    
    init() {
        // TODO: Move DataStore to app-wide.
        self.dataStore = DataStore()
        
        if (try? keychain.get("skinge-ios-access-token")) != nil {
            self.userLoginState = .loggedIn
        } else { self.userLoginState = .loggedOut }
    }
    
    // MARK: - Public Functions
    
    func login(_ user: User) {
        dataStore?.login(user) { (response: AccessToken?) in
            guard let accessToken = response?.key else {
                self.state = .failed
                return
            }
            
            DispatchQueue.main.async {
                self.keychain["skinge-ios-access-token"] = accessToken
                self.userLoginState = .loggedIn
            }
        }
    }
    
    func logout() {
        keychain["skinge-ios-access-token"] = nil
        self.userLoginState = .loggedOut
    }

}
