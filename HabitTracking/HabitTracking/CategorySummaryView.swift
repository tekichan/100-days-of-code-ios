//
//  CategorySummaryView.swift
//  HabitTracking
//
//  Created by Chan, Teki on 23/06/2022.
//

import SwiftUI

struct CategorySummaryView: View {
    var category: Category
    @ObservedObject var activities: Activities
    var count: Int {
        var c = 0
        for i in 0..<activities.activityItems.count {
            if activities.activityItems[i].categoryId == category.id {
                c += 1
            }
        }
        return c
    }
    var totalDuration: Double {
        var d = 0.0
        for i in 0..<activities.activityItems.count {
            if activities.activityItems[i].categoryId == category.id {
                d += activities.activityItems[i].duration
            }
        }
        return d
    }
    
    var body: some View {
        VStack {
            Text("Summary")
                .font(.largeTitle)
            
            HStack {
                Text("Category: ")
                    .font(.headline)
                Text("\(category.title)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()

            HStack {
                Text("Description: ")
                    .font(.headline)
                Text("\(category.description)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            HStack {
                Text("Count: ")
                    .font(.headline)
                Text("\(count)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()

            HStack {
                Text("Duration: ")
                    .font(.headline)
                Text("\(totalDuration, specifier: "%.2f")")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
}

struct CategorySummaryView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySummaryView(category: Categories().categoryItems.first!, activities: Activities())
    }
}
