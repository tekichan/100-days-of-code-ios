//
//  ViewCompositionView.swift
//  CustomExample
//
//  Created by Chan, Teki on 02/06/2022.
//

import SwiftUI

struct ViewCompositionView: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .foregroundColor(.white)
            CapsuleText(text: "Second")
                .foregroundColor(.yellow)
        }
    }
}

struct ViewCompositionView_Previews: PreviewProvider {
    static var previews: some View {
        ViewCompositionView()
    }
}
