//
//  ExpiredTaskRow.swift
//  TodayTasks
//
//  Created by Jay on 5/21/26.
//

import SwiftUI

struct ExpiredTaskRowView: View {
    let task: Task

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "xmark.circle")
                .font(.title2)
                .foregroundStyle(.gray)
            Text(task.title)
                .foregroundStyle(.gray)
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
        )
    )
    .padding()
}
