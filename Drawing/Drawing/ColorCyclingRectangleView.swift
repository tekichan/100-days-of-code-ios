//
//  ColorCyclingRectangleView.swift
//  Drawing
//
//  Created by Chan, Teki on 22/06/2022.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    var positionX: Double
    var positionY: Double

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.1)
                            ]),
                            startPoint: UnitPoint(x: positionX, y: 1-positionY),
                            endPoint: UnitPoint(x: 1-positionX, y: positionY)
                        ),
                        lineWidth: 1
                    )
            }
        }
        .drawingGroup()
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ColorCyclingRectangleView: View {
    @State private var colorCycle = 0.0
    @State private var positionX = 0.0
    @State private var positionY = 0.0

    var body: some View {
        VStack {
            ColorCyclingRectangle(amount: colorCycle, positionX: positionX, positionY: positionY)
                .frame(width: 300, height: 300)

            HStack {
                Text("Color Cycle:")
                Slider(value: $colorCycle)
            }
            .padding()
            
            HStack {
                Text("X Position:")
                Slider(value: $positionX)
            }
            .padding()
            
            HStack {
                Text("Y Position:")
                Slider(value: $positionY)
            }
            .padding()
        }
    }
}

struct ColorCyclingRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCyclingRectangleView()
    }
}
