//
//  HomeView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 11/11/22.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Body

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Image("skier")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 10)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Find your perfect setup")
                        .font(.title)
                    Text("See details for hundreds of skis")
                }
                .padding()
                Spacer()
            }
            .navigationTitle("Ski Finder")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
