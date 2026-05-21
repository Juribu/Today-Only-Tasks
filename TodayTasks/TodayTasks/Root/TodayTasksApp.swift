//
//  TodayTasksApp.swift
//  TodayTasks
//
//  Created by Jay on 5/20/26.
//

import SwiftUI

@main
struct TodayTasksApp: App {
    @StateObject private var viewModel = TodayViewModel(store: FileTaskStore())

    init() {
        NotificationManager.shared.requestAuthorization()
    }

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
