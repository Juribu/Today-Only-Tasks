//
//  TaskRowView.swift
//  TodayTasks
//
//  Created by Jay on 5/20/26.
//

import SwiftUI

struct ActiveTaskRowView: View {
    let task: Task
    let isExpiringSoon: Bool

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "circle")
                .font(.title2)
                .foregroundStyle(.primary)
            VStack(alignment: .leading, spacing: 4) {
                Text(task.title)
                    .foregroundStyle(.primary)
                if isExpiringSoon {
                    Text("Expires in two hours")
                        .font(.caption)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color.red)
                        )
                }
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
    ActiveTaskRowView(
        task: Task(title: "Buy groceries", expireTime: Date().addingTimeInterval(3600)),
        isExpiringSoon: true
    )
    .padding()
}
