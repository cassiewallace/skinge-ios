//
//  HomeView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 11/11/22.
//

import SwiftUI

struct HomeView: View {
    @State private var showingLoginSignupSheet = false
    
    // MARK: - Body

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Image("skier")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 10)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Find your perfect setup")
                        .font(.title)
                        .bold()
                    Text("See details for hundreds of skis")
                }
                .padding()
                Spacer()
            }
            .navigationTitle("Ski Finder")
            .toolbar {
                // TODO: Add conditional logic with 3 states: not logged in
                Button {
                    showingLoginSignupSheet.toggle()
                } label: {
                    Image(systemName: "person.crop.circle.fill")
                        .foregroundColor(.black)
                }
            }
            .sheet(isPresented: $showingLoginSignupSheet) {
                LoginSignupView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
