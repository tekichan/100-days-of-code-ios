//
//  ActivityFormView.swift
//  HabitTracking
//
//  Created by Chan, Teki on 23/06/2022.
//

import SwiftUI

struct ActivityFormView: View {
    @ObservedObject var activities: Activities
    @ObservedObject var categories: Categories
    
    @State private var categoryId = UUID()
    @State private var activityDate = Date.now
    @State private var description = ""
    @State private var duration = 0.0
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Category")
                        .font(.caption)
                    
                    Picker("Category", selection: $categoryId) {
                        ForEach(categories.categoryItems) {
                            Text($0.title)
                        }
                    }
                }
                .padding(0)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Description")
                        .font(.caption)
                    TextField("Activity Description", text: $description)
                }
                .padding(0)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Date")
                        .font(.caption)

                    DatePicker("Activity Date", selection: $activityDate, displayedComponents: .date)
                        .labelsHidden()
                        .clipped()
                        .padding(0)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Duration (hours)")
                        .font(.caption)

                    Stepper("\(duration.formatted()) hours", value: $duration, in: 0...24, step: 0.25)
                }
            }
            .navigationTitle("Activity Form")
            .toolbar {
                Button("Save") {
                    let item = Activity(id: UUID(), categoryId: categoryId, activityDate: activityDate, description: description, duration: duration)
                    activities.activityItems.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct ActivityFormView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityFormView(activities: Activities(), categories: Categories())
    }
}
