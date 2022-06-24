//
//  ContentView.swift
//  HabitTracking
//
//  Created by Chan, Teki on 22/06/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    @StateObject var categories = Categories()
    
    enum Tab {
        case catView
        case actView
    }
    @State private var selection: Tab = .actView
        
    var body: some View {
        TabView(selection: $selection) {
            ActivityListView(activities:activities, categories:categories)
            .tabItem {
                Label("Activity", systemImage: "list.bullet")
            }
            .tag(Tab.actView)
            
            CategoryListView(activities:activities, categories:categories)
            .tabItem {
                Label("Category", systemImage: "folder")
            }
            .tag(Tab.catView)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
