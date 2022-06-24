//
//  Category.swift
//  HabitTracking
//
//  Created by Chan, Teki on 22/06/2022.
//

import Foundation

struct Category: Codable, Hashable, Identifiable {
    let id: UUID
    let title: String
    let description: String
}
