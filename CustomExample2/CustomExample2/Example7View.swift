//
//  Example7View.swift
//  CustomExample2
//
//  Created by Chan, Teki on 09/06/2022.
//

import SwiftUI

struct Example7View: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }

            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.scale)
                    // .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct Example7View_Previews: PreviewProvider {
    static var previews: some View {
        Example7View()
    }
}
