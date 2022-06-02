//
//  CustomModifierView.swift
//  CustomExample
//
//  Created by Chan, Teki on 02/06/2022.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.thinMaterial)
                .background(.black)
        }
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct CustomModifierView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .modifier(Title())
            Text("Hello World")
                .titleStyle()
            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Watermarked Text")
        }
    }
}

struct CustomModifierView_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifierView()
    }
}
