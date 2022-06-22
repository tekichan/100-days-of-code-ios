//
//  TextImageView.swift
//  Drawing
//
//  Created by Chan, Teki on 20/06/2022.
//

import SwiftUI

struct TextImageView: View {
    var body: some View {
        ScrollView {
        VStack {
            Text("Hello World")
                .frame(width: 300, height: 300)
                .background(Image("Example"))
            
            Text("Hello World")
                .frame(width: 300, height: 300)
                .border(ImagePaint(image: Image("Example"), scale: 0.2), width: 30)
            
            Text("Hello World")
                .frame(width: 300, height: 300)
                .border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
            
            Capsule()
                .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.1), lineWidth: 20)
                .frame(width: 300, height: 200)
        }
        }
    }
}

struct TextImageView_Previews: PreviewProvider {
    static var previews: some View {
        TextImageView()
    }
}
