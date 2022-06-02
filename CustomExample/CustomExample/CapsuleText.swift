//
//  CapsuleText.swift
//  CustomExample
//
//  Created by Chan, Teki on 02/06/2022.
//

import SwiftUI

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct CapsuleText_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleText(text: "Hello World")
    }
}
