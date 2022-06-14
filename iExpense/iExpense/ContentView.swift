//
//  ContentView.swift
//  iExpense
//
//  Created by Chan, Teki on 13/06/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    let currencyCode = Locale.current.currencyCode ?? "GBP"
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func getBgColor(_ item: ExpenseItem) -> Color {
        if item.type == "Personal" {
            if item.amount > 100.0 {
                return Color.purple
            } else if item.amount > 10.0 {
                return Color.yellow
            } else {
                return Color.mint
            }
        } else {
            if item.amount > 100.0 {
                return Color.red
            } else if item.amount > 10.0 {
                return Color.orange
            } else {
                return Color.green
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Section {
                    VStack {
                        Text("Personal")
                            .font(.headline)
                        List {
                            ForEach(expenses.items.filter {$0.type == "Personal"}) { item in
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        Text(item.type)
                                    }
                                    Spacer()
                                    Text(item.amount, format: .currency(code: currencyCode))
                                }
                                .listRowBackground(getBgColor(item))
                            }
                            .onDelete(perform: removeItems)
                        }
                    }
                }
                Section {
                    VStack {
                        Text("Business")
                            .font(.headline)
                        List {
                            ForEach(expenses.items.filter {$0.type == "Business"}) { item in
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        Text(item.type)
                                    }
                                    Spacer()
                                    Text(item.amount, format: .currency(code: currencyCode))
                                }
                                .listRowBackground(getBgColor(item))
                            }
                            .onDelete(perform: removeItems)
                        }
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                // show an AddView here
                AddView(expenses: expenses)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
