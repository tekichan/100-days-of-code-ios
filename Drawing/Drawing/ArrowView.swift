//
//  ArrowView.swift
//  Drawing
//
//  Created by Chan, Teki on 22/06/2022.
//

import SwiftUI

struct Arrow: Shape {
    var widthRatio: Double
    
    var animatableData: Double {
        get { widthRatio }
        set { widthRatio = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let leftPt = (1.0 - widthRatio)/2.0
        let rightPt = 1.0 - leftPt

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLines( [
            CGPoint(x: rect.width * leftPt, y: rect.height),
            CGPoint(x: rect.width * leftPt, y: rect.height * 0.4),
            CGPoint(x: rect.width * 0.2, y: rect.height * 0.4),
            CGPoint(x: rect.width * 0.5, y: rect.height * 0.1),
            CGPoint(x: rect.width * 0.8, y: rect.height * 0.4),
            CGPoint(x: rect.width * rightPt, y: rect.height * 0.4),
            CGPoint(x: rect.width * rightPt, y: rect.height),
        ])
        path.closeSubpath()
        
        return path
    }
}

struct ArrowView: View {
    @State private var widthRatio = 0.2
    
    var body: some View {
        Arrow(widthRatio: widthRatio)
            .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 300, height: 300)
            .onTapGesture {
                withAnimation {
                    widthRatio = Double.random(in: 0.1...0.5)
                }
            }
    }
}

struct ArrowView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowView()
    }
}
