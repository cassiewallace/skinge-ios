//
//  SkiVariants.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 12/28/22.
//

import Foundation
import SwiftUI

struct SkiVariants: View {

    // MARK: - Variables
    
    var ski: Ski

    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Sizes")
                .font(.title3)
                .bold()
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(" ")
                    Text("Turning Radius")
                    Text("Tip Width")
                    Text("Waist Width")
                    Text("Tail Width")
                    Text("Individual Weight")
                }
                .bold()
                ForEach(ski.variants ?? [], id: \.self) { variant in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(String(variant.size)).bold()
                        Text(variant.turningRadius ?? "")
                        Text(variant.tipWidth?.string ?? "")
                        Text(variant.waistWidth?.string ?? "")
                        Text(variant.tailWidth?.string ?? "")
                        Text(variant.individualWeight?.string ?? "")
                    }
                }
            }
        }
        .padding()
    }
   
}
