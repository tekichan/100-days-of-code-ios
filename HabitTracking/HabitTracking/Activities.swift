//
//  Activities.swift
//  HabitTracking
//
//  Created by Chan, Teki on 22/06/2022.
//

import Foundation

class Activities: ObservableObject {
    let encodedKey = "activityItems"
    
    @Published var activityItems = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activityItems) {
                UserDefaults.standard.set(encoded, forKey: encodedKey)
            }
        }
    }
    
    init() {
        if let savedactivityItems = UserDefaults.standard.data(forKey: encodedKey) {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedactivityItems) {
                activityItems = decodedItems
                return
            }
        }

        activityItems = []
    }
}
