//
//  HomeView.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 11/11/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image("skier")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            Text("Ski Finder")
                .font(.largeTitle)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
