//
//  Categories.swift
//  HabitTracking
//
//  Created by Chan, Teki on 22/06/2022.
//

import Foundation

class Categories: ObservableObject {
    let encodedKey = "categoryItems"
    
    @Published var categoryItems = [Category]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(categoryItems) {
                UserDefaults.standard.set(encoded, forKey: encodedKey)
            }
        }
    }
    
    init() {
        if let savedcategoryItems = UserDefaults.standard.data(forKey: encodedKey) {
            if let decodedItems = try? JSONDecoder().decode([Category].self, from: savedcategoryItems) {
                categoryItems = decodedItems
                return
            }
        }

        categoryItems = []
    }
}
