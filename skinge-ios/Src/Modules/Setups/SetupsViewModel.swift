//
//  SetupsViewModel.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 1/21/23.
//

import Foundation

class SetupsViewModel: ObservableObject {

    // MARK: - Public Variables
    @Published var setups = [Setup]()

    // MARK: - Private Variables
    
    private var dataStore = DataStore()
    @Published private(set) var state: Constants.State = .idle
    @Published private(set) var userLoginState: UserSettings.LoginState = .loggedOut
    
    // MARK: - Public Functions
    
    func load(with userSettings: UserSettings) {
        switch userSettings.userLoginState {
        case .loggedIn:
            userLoginState = .loggedIn
            getSetups()
        case .loggedOut:
            userLoginState = .loggedOut
        }
    }
    
    func getSetups() {
        state = .loading
    
        dataStore.getSetups() { (setups: [Setup]?) in
            guard let setups = setups else {
                self.state = .failed
                return
            }
            DispatchQueue.main.async {
                self.setups = setups
                self.state = .loaded
            }
        }
    }
}
