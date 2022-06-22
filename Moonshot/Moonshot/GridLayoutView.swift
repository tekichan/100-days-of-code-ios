//
//  GridLayoutView.swift
//  Moonshot
//
//  Created by Chan, Teki on 16/06/2022.
//

import SwiftUI

struct GridLayoutView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    VStack {
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            MissionIconView(mission: mission)
                        }
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct GridLayoutView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        GridLayoutView(missions: missions, astronauts: astronauts)
    }
}
