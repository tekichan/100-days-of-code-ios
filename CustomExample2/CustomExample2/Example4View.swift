//
//  Example4View.swift
//  CustomExample2
//
//  Created by Chan, Teki on 09/06/2022.
//

import SwiftUI

struct Example4View: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(.default, value: enabled)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
    }
}

struct Example4View_Previews: PreviewProvider {
    static var previews: some View {
        Example4View()
    }
}
