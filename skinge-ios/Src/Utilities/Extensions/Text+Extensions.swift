//
//  Text+Extensions.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 11/11/22.
//

import SwiftUI

struct Tagify: ViewModifier {

    let color: Color

    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.white)
            .fontWeight(.bold)
            .padding(5)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
    
}

extension Text {
    
    func tagify(color: Color) -> some View {
        modifier(Tagify(color: color))
    }
    
}
