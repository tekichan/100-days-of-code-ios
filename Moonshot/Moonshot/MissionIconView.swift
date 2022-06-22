//
//  MissionIconView.swift
//  Moonshot
//
//  Created by Chan, Teki on 16/06/2022.
//

import SwiftUI

struct MissionIconView: View {
    let mission: Mission
    
    var body: some View {
        VStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()

            VStack {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        )
    }
}

struct MissionIconView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionIconView(mission: missions[0])
    }
}
