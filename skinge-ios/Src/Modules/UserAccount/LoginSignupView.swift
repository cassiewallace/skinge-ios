//
//  LoginSignupView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 12/31/22.
//

import SwiftUI

struct LoginSignupView: View {

    // MARK: - Public Variables
    
    @ObservedObject var viewModel = LoginSignupViewModel()
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var userSettings: UserSettings
	@State var username: String = ""
    @State var password: String = ""
    
    var user: User {
        get { return User(email: username, password: password) }
    }
    
    // MARK: - Private Variables
    
    private let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

    // MARK: - Body
    
    var body: some View {
        NavigationView {
            switch viewModel.userLoginState {
            case .loggedIn: logoutView
            case .loggedOut: loginView
            }
        }
        .onAppear { viewModel.load(with: userSettings) }
    }
    
    var loginView: some View {
        VStack(spacing: 20) {
            Text("Welcome back!")
                .font(.title)
            TextField("Username", text: $username)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
            SecureField("Password", text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
            Button {
                viewModel.login(user)
                dismiss()
            } label: {
                Text("Log in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.pink)
                    .cornerRadius(5.0)
            }
        }
        .padding()
        .navigationTitle("Log in")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            toolbarDismissButton
        }
    }
    
    var logoutView: some View {
        Button {
            viewModel.logout()
            dismiss()
        } label: {
            Text("Log out")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.pink)
                .cornerRadius(5.0)
        }
        .padding()
        .navigationTitle("Log out")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            toolbarDismissButton
        }
    }
    
    var toolbarDismissButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .foregroundColor(.black)
        }
    }
    
}

struct LoginSignupView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignupView()
    }
}
