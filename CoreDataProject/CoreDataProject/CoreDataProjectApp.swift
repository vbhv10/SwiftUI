//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by vaibhav mahajan on 1/13/23.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
