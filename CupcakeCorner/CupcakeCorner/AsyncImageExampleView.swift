//
//  AsyncImageExampleView.swift
//  CupcakeCorner
//
//  Created by Chan, Teki on 27/06/2022.
//

import SwiftUI

struct AsyncImageExampleView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://www.hackingwithswift.com/samples/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                // Text("There was an error loading the image.")
                Text(phase.error.debugDescription)
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

struct AsyncImageExampleView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageExampleView()
    }
}
