//
//  UserSettings.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 1/19/23.
//

import Foundation
import KeychainAccess

class UserSettings: ObservableObject {

    // MARK: - Enumerations

    enum LoginState {
        case loggedIn
        case loggedOut
    }

    // MARK: - Public Variables
    
    public var userLoginState: LoginState {
        get {
            let keychain = Keychain(service: "cassiewallace.skinge-ios")
            if (try? keychain.get("skinge-ios-access-token")) != nil {
                return .loggedIn
            } else {
                return .loggedOut }
        }
    }
    
}
