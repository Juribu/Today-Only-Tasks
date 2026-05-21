//
//  TaskRowView.swift
//  TodayTasks
//
//  Created by Jay on 5/20/26.
//

import SwiftUI

struct ActiveTaskRowView: View {
    let task: Task

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "circle")
                .font(.title2)
                .foregroundStyle(.primary)
            Text(task.title)
                .foregroundStyle(.primary)
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
    ActiveTaskRowView(
        task: Task(title: "Buy groceries", expireTime: Date().addingTimeInterval(3600))
    )
    .padding()
}
