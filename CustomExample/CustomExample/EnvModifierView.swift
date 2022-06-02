//
//  EnvModifierView.swift
//  CustomExample
//
//  Created by Chan, Teki on 02/06/2022.
//

import SwiftUI

struct EnvModifierView: View {
    var body: some View {
        // font() is an environment modifier, which means the Gryffindor text view can override it with a custom font.
        VStack {
            Text("Gryffindor")
                .font(.largeTitle)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
        
        // blur() is a regular modifier, so any blurs applied to child views are added to the VStack blur rather than replacing it.
        VStack {
            Text("Gryffindor")
                .blur(radius: 0)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .blur(radius: 5)
    }
}

struct EnvModifierView_Previews: PreviewProvider {
    static var previews: some View {
        EnvModifierView()
    }
}
