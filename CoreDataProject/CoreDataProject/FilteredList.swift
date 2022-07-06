//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Chan, Teki on 06/07/2022.
//

import SwiftUI
import CoreData

enum FilteredPredicate: String, CaseIterable, Identifiable {
    case BEGIN
    case END
    
    var id: String { return self.rawValue }
    
    var text: String {
        switch self {
        case .BEGIN: return "Begins with"
        case .END: return "Ends with"
        }
    }
    
    var predicate : String {
        switch self {
        case .BEGIN: return "%K BEGINSWITH %@"
        case .END: return "%K ENDSWITH %@"
        }
    }
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>

    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }

    init(predicate: FilteredPredicate, sortDescriptors: [SortDescriptor<T>], filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors, predicate: NSPredicate(format: predicate.predicate, filterKey, filterValue))
        self.content = content
    }
}
