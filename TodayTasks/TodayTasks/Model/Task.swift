//
//  Task.swift
//  TodayTasks
//
//  Created by Jay on 5/20/26.
//

import Foundation

struct Task: Codable, Identifiable, Equatable {
    let id: UUID
    var title: String
    let createdTime: Date
    let expireTime: Date
    var isCompleted: Bool

    init(
        id: UUID = UUID(),
        title: String,
        createdTime: Date = Date(),
        expireTime: Date,
        isCompleted: Bool = false
    ) {
        self.id = id
        self.title = title
        self.createdTime = createdTime
        self.expireTime = expireTime
        self.isCompleted = isCompleted
    }
}
