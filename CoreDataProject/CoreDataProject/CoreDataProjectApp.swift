//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Chan, Teki on 05/07/2022.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            SingerView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
