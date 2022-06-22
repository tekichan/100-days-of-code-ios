//
//  BlendView.swift
//  Drawing
//
//  Created by Chan, Teki on 20/06/2022.
//

import SwiftUI

struct BlendView: View {
    var body: some View {
        ZStack {
            Image("Developer")

            Rectangle()
                .fill(.red)
                .blendMode(.multiply)
        }
        .frame(width: 400, height: 500)
        .clipped()
    }
}

struct BlendView2: View {
    var body: some View {
        Image("Developer")
                .colorMultiply(.red)

    }
}

struct BlendView3: View {
    @State private var amount = 0.0

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.red)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)

                Circle()
                    .fill(.green)
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)

                Circle()
                    .fill(.blue)
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)

            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct BlendView4: View {
    @State private var amount = 0.0

    var body: some View {
        VStack {
            Image("Developer")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)

            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct BlendView_Previews: PreviewProvider {
    static var previews: some View {
        BlendView()
        BlendView2()
        BlendView3()
        BlendView4()
    }
}
