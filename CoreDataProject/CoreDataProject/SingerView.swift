//
//  SingerView.swift
//  CoreDataProject
//
//  Created by Chan, Teki on 05/07/2022.
//

import SwiftUI

struct SingerView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    @State private var selectedPredicate = FilteredPredicate.BEGIN
    private var sortDescriptors: [SortDescriptor<Singer>] =  [SortDescriptor(\.lastName, order: .reverse), SortDescriptor(\.firstName)]
    
    var body: some View {
        VStack {
            Picker("Select Predicate", selection: $selectedPredicate) {
                ForEach(FilteredPredicate.allCases, id: \.id) { item in
                    Text(item.text).tag(item)
                }
            }
            Text("Filter by lastName \(selectedPredicate.text) \(lastNameFilter)")
            
            // list of matching singers
            FilteredList(predicate: selectedPredicate, sortDescriptors: sortDescriptors, filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }

            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"

                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"

                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"

                try? moc.save()
            }

            Button("Show A") {
                lastNameFilter = "A"
            }

            Button("Show S") {
                lastNameFilter = "S"
            }
        }
    }
}

struct SingerView_Previews: PreviewProvider {
    static var previews: some View {
        SingerView()
    }
}
