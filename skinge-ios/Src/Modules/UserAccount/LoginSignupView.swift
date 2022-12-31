//
//  LoginSignupView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 12/31/22.
//

import SwiftUI

struct LoginSignupView: View {

    // MARK: - Public Variables
    
    @Environment(\.dismiss) var dismiss

    // MARK: - Body
    
    var body: some View {
        NavigationView {
            Text("Form view")
            .navigationTitle("Log in or sign up")
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct LoginSignupView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignupView()
    }
}
