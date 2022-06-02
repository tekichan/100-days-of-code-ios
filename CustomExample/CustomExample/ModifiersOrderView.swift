//
//  ModifiersOrderView.swift
//  CustomExample
//
//  Created by Chan, Teki on 02/06/2022.
//

import SwiftUI

struct ModifiersOrderView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)
    }
}

struct ModifiersOrderView_Previews: PreviewProvider {
    static var previews: some View {
        ModifiersOrderView()
    }
}
