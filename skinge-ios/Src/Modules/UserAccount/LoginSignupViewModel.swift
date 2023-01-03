//
//  LoginSignupViewModel.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 1/2/23.
//

import Foundation

class LoginSignupViewModel: ObservableObject {

    // MARK: - Private Variables
    
    private var dataStore: DataStore?
    @Published private(set) var state: Constants.State = .idle
    
    // MARK: Init(s)
    
    init() {
        // TODO: Move DataStore to app-wide.
        self.dataStore = DataStore()
    }
    
    // MARK: - Public Functions
    
    func login(user: UserCredential, completionHandler: @escaping (AccessToken?) -> Void) {
        state = .loading
    
        dataStore?.login(user) { (response: AccessToken?) in
            guard let response = response else {
                self.state = .failed
                return
            }
            DispatchQueue.main.async {
                completionHandler(response)
                self.state = .loaded
            }
        }
    }

}
