//
//  Activity.swift
//  HabitTracking
//
//  Created by Chan, Teki on 22/06/2022.
//

import Foundation

struct Activity: Codable, Identifiable {
    let id: UUID
    let categoryId: UUID
    let activityDate: Date
    let description: String
    let duration: Double
}
