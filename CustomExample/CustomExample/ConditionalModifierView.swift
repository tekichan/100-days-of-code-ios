//
//  ConditionalModifierView.swift
//  CustomExample
//
//  Created by Chan, Teki on 02/06/2022.
//

import SwiftUI

struct ConditionalModifierView: View {
    @State private var useRedText = false
    var body: some View {
        Button("Hello World") {
            // flip the Boolean between true and false
            useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue)
    }
}

struct ConditionalModifierView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalModifierView()
    }
}
