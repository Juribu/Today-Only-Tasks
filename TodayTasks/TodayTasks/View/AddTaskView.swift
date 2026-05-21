//
//  AddTaskView.swift
//  TodayTasks
//
//  Created by Jay on 5/20/26.
//

import SwiftUI

struct AddTaskView: View {
    @ObservedObject var viewModel: TodayViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var title: String = ""
    @State private var expireTime: Date = AddTaskView.defaultExpireTime()

    var body: some View {
        VStack(spacing: 16) {
            TextField("Enter a task for today", text: $title)
                .textFieldStyle(.roundedBorder)

            DatePicker(
                "Expires at",
                selection: $expireTime,
                displayedComponents: .hourAndMinute
            )

            AddTaskButton {
                let task = Task(
                    id: UUID(),
                    title: title,
                    createdTime: Date(),
                    expireTime: expireTime,
                    isCompleted: false
                )
                viewModel.add(task)
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                dismiss()
            }
        }
        .padding(20)
    }

    private static func defaultExpireTime() -> Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day], from: Date())
        components.hour = 23
        components.minute = 59
        return calendar.date(from: components) ?? Date()
    }
}
