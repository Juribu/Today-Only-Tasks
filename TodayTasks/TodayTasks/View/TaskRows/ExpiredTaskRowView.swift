//
//  ExpiredTaskRow.swift
//  TodayTasks
//
//  Created by Jay on 5/21/26.
//

import SwiftUI

struct ExpiredTaskRowView: View {
    let task: Task
    let isPreviousDay: Bool

    private var expirationText: String {
        if isPreviousDay {
            return "Expired Previous Days"
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return "Expired At \(formatter.string(from: task.expireTime))"
    }

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "xmark.circle")
                .font(.title2)
                .foregroundStyle(.gray)
            VStack(alignment: .leading, spacing: 4) {
                Text(task.title)
                    .foregroundStyle(.gray)
                Text(expirationText)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
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
    ExpiredTaskRowView(
        task: Task(
            title: "Call dentist",
            expireTime: Date().addingTimeInterval(-3600)
        ),
        isPreviousDay: false
    )
    .padding()
}
