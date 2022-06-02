//
//  CustomContainerView.swift
//  CustomExample
//
//  Created by Chan, Teki on 02/06/2022.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    // adding @ViewBuilder makes us not necessarily use VStack or HStack to cover multiple views
    @ViewBuilder let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct CustomContainerView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}

struct CustomContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomContainerView()
    }
}
