//
//  TodayViewModel.swift
//  TodayTasks
//
//  Created by Jay on 5/20/26.
//

import Foundation
import Combine

@MainActor
final class TodayViewModel: ObservableObject {
    @Published private var tasks: [Task] = []
    private let store: TaskStore

    init(store: TaskStore) {
        self.store = store
        do {
            self.tasks = try store.load()
        } catch {
            print("Failed to load tasks: \(error)")
            self.tasks = []
        }
        for task in tasks {
            NotificationManager.shared.scheduleExpirationReminder(for: task)
        }
    }

    var activeTasks: [Task] {
        let now = Date()
        return tasks.filter { task in
            !task.isCompleted
                && task.expireTime > now
                && Calendar.current.isDateInToday(task.createdTime)
        }
    }

    var completedTasks: [Task] {
        tasks.filter { task in
            task.isCompleted
                && Calendar.current.isDateInToday(task.createdTime)
        }
    }

    var expiredTasks: [Task] {
        let now = Date()
        return tasks.filter { task in
            !task.isCompleted && task.expireTime <= now
        }
    }

    var expiredToday: [Task] {
        expiredTasks.filter { Calendar.current.isDateInToday($0.createdTime) }
    }

    var expiredPreviousDays: [Task] {
        expiredTasks.filter { !Calendar.current.isDateInToday($0.createdTime) }
    }

    func saveToStore() {
        do {
            try store.save(tasks)
        } catch {
            print("Failed to save tasks: \(error)")
        }
    }

    func add(_ task: Task) {
        tasks.append(task)
        saveToStore()
        NotificationManager.shared.scheduleExpirationReminder(for: task)
    }

    func delete(_ task: Task) {
        tasks.removeAll { $0.id == task.id }
        saveToStore()
        NotificationManager.shared.cancelExpirationReminder(for: task)
    }

    func toggleComplete(_ task: Task) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else {
            return
        }
        tasks[index].isCompleted.toggle()
        saveToStore()
        if tasks[index].isCompleted {
            NotificationManager.shared.cancelExpirationReminder(for: tasks[index])
        } else {
            NotificationManager.shared.scheduleExpirationReminder(for: tasks[index])
        }
    }
}
