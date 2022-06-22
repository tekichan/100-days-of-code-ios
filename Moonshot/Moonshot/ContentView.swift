//
//  ContentView.swift
//  Moonshot
//
//  Created by Chan, Teki on 15/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .gridview
    
    enum Tab {
        case gridview
        case listview
    }
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                GridLayoutView(missions: missions, astronauts: astronauts)
                .navigationTitle("Moonshot")
                .background(.darkBackground)
                .preferredColorScheme(.dark)
            }
            .tabItem {
                Label("Grid", systemImage: "star")
            }
            .tag(Tab.gridview)
            
            NavigationView {
                ListLayoutView(missions: missions, astronauts: astronauts)
                .navigationTitle("Moonshot")
                .background(.darkBackground)
                .preferredColorScheme(.dark)
            }
            .tabItem {
                Label("List", systemImage: "list.bullet")
            }
            .tag(Tab.listview)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
