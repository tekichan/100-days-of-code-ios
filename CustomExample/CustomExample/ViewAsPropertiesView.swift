//
//  ViewAsPropertiesView.swift
//  CustomExample
//
//  Created by Chan, Teki on 02/06/2022.
//

import SwiftUI

struct ViewAsPropertiesView: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    var motto3: some View {
        Text("Draco dormiens")
    }
    
    var spells1: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    @ViewBuilder var spells2: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            motto1
                .foregroundColor(.red)
            motto2
                .foregroundColor(.blue)
            motto3
            spells1
            spells2
        }
    }
}

struct ViewAsPropertiesView_Previews: PreviewProvider {
    static var previews: some View {
        ViewAsPropertiesView()
    }
}
