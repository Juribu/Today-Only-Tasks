//
//  FileTaskStore.swift
//  TodayTasks
//
//  Created by Jay on 5/20/26.
//

import Foundation

struct FileTaskStore: TaskStore {
    private let fileURL: URL
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder

    init(fileName: String = "tasks.json") {
        let directory = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )[0]
        self.fileURL = directory.appendingPathComponent(fileName)

        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        self.encoder = encoder

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        self.decoder = decoder
    }

    func load() throws -> [Task] {
        guard FileManager.default.fileExists(atPath: fileURL.path) else {
            return []
        }
        let data = try Data(contentsOf: fileURL)
        return try decoder.decode([Task].self, from: data)
    }
    
    func save(_ tasks: [Task]) throws {
        let data = try encoder.encode(tasks)
        try data.write(to: fileURL, options: [.atomic])
    }
}
