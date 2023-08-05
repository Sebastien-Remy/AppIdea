//
//  AppIdeaApp.swift
//  AppIdea
//
//  Created by Sebastien REMY on 05/08/2023.
//

import SwiftUI
import SwiftData

@main
struct AppIdeaApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [AppIdea.self, AppFeature.self])
    }
}
