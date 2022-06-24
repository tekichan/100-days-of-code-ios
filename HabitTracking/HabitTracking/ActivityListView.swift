//
//  ActivityListView.swift
//  HabitTracking
//
//  Created by Chan, Teki on 22/06/2022.
//

import SwiftUI

struct ActivityListView: View {
    @ObservedObject var activities: Activities
    @ObservedObject var categories: Categories
    @State private var isActivityFormVisible = false
    
    func removeActivities(at offsets: IndexSet) {
        activities.activityItems.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.activityItems) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.description)
                                .font(.headline)
                            Text(item.activityDate, format: Date.FormatStyle(date: .numeric, time: .omitted))
                        }
                        Spacer()
                        Text(item.duration, format: .number)
                    }
                }
                .onDelete(perform: removeActivities)
            }
            .navigationTitle("Activity List")
            .toolbar {
                Button {
                    isActivityFormVisible = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isActivityFormVisible) {
                ActivityFormView(activities: activities, categories: categories)
            }
        }
    }
}

struct ActivityListView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityListView(activities: Activities(), categories: Categories())
    }
}
