//
//  CategoryFormView.swift
//  HabitTracking
//
//  Created by Chan, Teki on 22/06/2022.
//

import SwiftUI

struct CategoryFormView: View {
    @State private var title = ""
    @State private var description = ""
    
    @ObservedObject var categories: Categories
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Title")
                        .font(.caption)
                    TextField("Title", text: $title)
                }
                .padding(0)

                VStack(alignment: .leading, spacing: 0) {
                    Text("Description")
                        .font(.caption)
                    TextEditor(text: $description)
                        .foregroundColor(.secondary)
                        .frame(height: 100)
                }
                .padding(0)
            }
            .navigationTitle("Category Form")
            .toolbar {
                Button("Save") {
                    let item = Category(id: UUID(), title: title, description: description)
                    categories.categoryItems.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct CategoryFormView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFormView(categories: Categories())
    }
}
