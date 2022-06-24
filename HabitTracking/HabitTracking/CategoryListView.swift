//
//  CategoryListView.swift
//  HabitTracking
//
//  Created by Chan, Teki on 22/06/2022.
//

import SwiftUI

struct CategoryListView: View {
    @ObservedObject var activities: Activities
    @ObservedObject var categories: Categories
    
    @State private var isCategoryFormVisible = false
    @State private var isSummaryVisible = false
    @State private var selectedCategoryId = UUID()
    
    func removeCategories(at offsets: IndexSet) {
        categories.categoryItems.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(categories.categoryItems) { item in
                    HStack {
                        Text(item.title)
                            .font(.headline)
                        
                        Button {
                            selectedCategoryId = item.id
                            isSummaryVisible = true
                        } label: {
                            Label("", systemImage: "viewfinder")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                }
                .onDelete(perform: removeCategories)
            }
            .navigationTitle("Category List")
            .toolbar {
                Button {
                    isCategoryFormVisible = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isCategoryFormVisible) {
                CategoryFormView(categories: categories)
            }
            .sheet(isPresented: $isSummaryVisible) {
                CategorySummaryView(category: categories.categoryItems.first { $0.id == selectedCategoryId } ?? Category(id: UUID(), title: "Unknown", description: "Unknown"), activities: activities)
            }
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView(activities: Activities(), categories: Categories())
    }
}
