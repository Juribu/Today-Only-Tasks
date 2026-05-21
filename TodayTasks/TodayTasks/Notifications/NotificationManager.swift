//
//  NotificationManager.swift
//  TodayTasks
//
//  Created by Jay on 5/21/26.
//

import Foundation
import UserNotifications

final class NotificationManager {
    static let shared = NotificationManager()

    private let center = UNUserNotificationCenter.current()
    private let leadTime: TimeInterval = 2 * 60 * 60

    private init() {}

    func requestAuthorization() {
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Notification authorization error: \(error)")
            } else if !granted {
                print("Notification authorization denied")
            }
        }
    }

    func scheduleExpirationReminder(for task: Task) {
        cancelExpirationReminder(for: task)

        guard !task.isCompleted else { return }

        let fireDate = task.expireTime.addingTimeInterval(-leadTime)
        guard fireDate > Date() else { return }

        let content = UNMutableNotificationContent()
        content.title = "Task expiring soon"
        content.body = "\"\(task.title)\" expires in 2 hours."
        content.sound = .default

        let components = Calendar.current.dateComponents(
            [.year, .month, .day, .hour, .minute, .second],
            from: fireDate
        )
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)

        let request = UNNotificationRequest(
            identifier: identifier(for: task),
            content: content,
            trigger: trigger
        )

        center.add(request) { error in
            if let error = error {
                print("Failed to schedule notification: \(error)")
            }
        }
    }

    func cancelExpirationReminder(for task: Task) {
        center.removePendingNotificationRequests(withIdentifiers: [identifier(for: task)])
    }

    private func identifier(for task: Task) -> String {
        "task-expiration-\(task.id.uuidString)"
    }
}
