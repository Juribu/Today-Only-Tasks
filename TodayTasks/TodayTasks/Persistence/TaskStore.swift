//
//  TaskStore.swift
//  TodayTasks
//
//  Created by Jay on 5/20/26.
//

import Foundation

protocol TaskStore {
    func load() throws -> [Task]
    func save(_ tasks: [Task]) throws
}
