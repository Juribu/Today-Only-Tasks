//
//  ExpiredView.swift
//  TodayTasks
//
//  Created by Jay on 5/20/26.
//

import SwiftUI

struct ExpiredView: View {
    @ObservedObject var viewModel: TodayViewModel

    var body: some View {
        NavigationStack {
            if viewModel.expiredTasks.isEmpty {
                Text("empty")
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .navigationTitle("Expired")
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Expired Today")
                            .font(.headline)
                            .foregroundStyle(.secondary)

                        ForEach(viewModel.expiredToday) { task in
                            ExpiredTaskRowView(task: task)
                        }

                        Text("Previous Days")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                            .padding(.top, 16)

                        ForEach(viewModel.expiredPreviousDays) { task in
                            ExpiredTaskRowView(task: task)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                }
                .navigationTitle("Expired")
            }
        }
    }
}
