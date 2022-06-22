//
//  MissionBadgeView.swift
//  Moonshot
//
//  Created by Chan, Teki on 16/06/2022.
//

import SwiftUI

struct MissionBadgeView: View {
    let mission: Mission
    let maxWidth: Double
    let displayedLaunchDate: String
    
    init(mission: Mission, maxWidth: Double) {
        self.mission = mission
        self.maxWidth = maxWidth
        
        if mission.formattedLaunchDate.isEmpty || mission.formattedLaunchDate == "N/A" {
            displayedLaunchDate = "Not launched"
        } else {
            displayedLaunchDate = mission.formattedLaunchDate
        }
    }
    
    var body: some View {
        VStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: maxWidth)
                .padding(.top)
            
            Text(displayedLaunchDate)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.caption)
        }
    }
}

struct MissionBadgeView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionBadgeView(mission: missions[0], maxWidth: 300)
        
        MissionBadgeView(mission: missions[1], maxWidth: 300)
    }
}
