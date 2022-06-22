//
//  ListLayoutView.swift
//  Moonshot
//
//  Created by Chan, Teki on 16/06/2022.
//

import SwiftUI

struct ListLayoutView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        List {
            ScrollView {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text(mission.displayName)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                }
            }
        }
    }
}

struct ListLayoutView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        ListLayoutView(missions: missions, astronauts: astronauts)
    }
}
