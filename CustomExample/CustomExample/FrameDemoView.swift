//
//  FrameDemoView.swift
//  CustomExample
//
//  Created by Chan, Teki on 02/06/2022.
//

import SwiftUI

struct FrameDemoView: View {
    var body: some View {
        Text("Hello, world!")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.red)
    }
}

struct FrameDemoView_Previews: PreviewProvider {
    static var previews: some View {
        FrameDemoView()
    }
}
