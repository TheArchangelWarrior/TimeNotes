//
//  assignmentNotebookApp.swift
//  assignmentNotebook
//
//  Created by Angel Bitsov on 3/15/24.
//

import SwiftUI
import SwiftData

@main
struct assignmentNotebookApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: DataModel.self)
    }
}
