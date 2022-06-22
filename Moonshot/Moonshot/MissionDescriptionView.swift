//
//  MissionDescriptionView.swift
//  Moonshot
//
//  Created by Chan, Teki on 16/06/2022.
//

import SwiftUI

struct MissionDescriptionView: View {
    let mission: Mission
    
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .frame(height: 2)
                .foregroundColor(.lightBackground)
                .padding(.bottom)
            
            Text("Mission Highlights")
                .font(.title.bold())
                .padding(.bottom, 5)

            Text(mission.description)
            
            Rectangle()
                .frame(height: 2)
                .foregroundColor(.lightBackground)
                .padding(.vertical)
            
            Text("Crew")
                .font(.title.bold())
                .padding(.bottom, 5)
        }
        .padding(.horizontal)
    }
}

struct MissionDescriptionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionDescriptionView(mission: missions[0])
    }
}
