//
//  CompletedTaskRow.swift
//  TodayTasks
//
//  Created by Jay on 5/21/26.
//

import SwiftUI

struct CompletedTaskRowView: View {
    let task: Task

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "checkmark.circle.fill")
                .font(.title2)
                .foregroundStyle(.green)
            Text(task.title)
                .strikethrough(true, color: .secondary)
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.secondarySystemBackground))
        )
    }
}

#Preview {
    CompletedTaskRowView(
        task: Task(
            title: "Finish report",
            expireTime: Date().addingTimeInterval(3600),
            isCompleted: true
        )
    )
    .padding()
}
