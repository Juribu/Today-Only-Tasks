//
//  TodayView.swift
//  TodayTasks
//
//  Created by Jay on 5/20/26.
//

import SwiftUI

struct TodayView: View {
    @ObservedObject var viewModel: TodayViewModel
    @State private var isShowingAddSheet = false

    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.activeTasks.isEmpty && viewModel.completedTasks.isEmpty {
                    Text("empty")
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        Section {
                            ForEach(viewModel.activeTasks) { task in
                                ActiveTaskRowView(task: task)
                                    .onTapGesture {
                                        viewModel.toggleComplete(task)
                                    }
                                    .listRowSeparator(.hidden)
                                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                        Button(role: .destructive) {
                                            viewModel.delete(task)
                                        } label: {
                                            Label("Delete", systemImage: "trash")
                                        }
                                    }
                                    .padding(.vertical, -5)
                            }
                        }

                        if !viewModel.completedTasks.isEmpty {
                            Section("Completed") {
                                ForEach(viewModel.completedTasks) { task in
                                    CompletedTaskRowView(task: task)
                                        .onTapGesture {
                                            viewModel.toggleComplete(task)
                                        }
                                        .listRowSeparator(.hidden)
                                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                            Button(role: .destructive) {
                                                viewModel.delete(task)
                                            } label: {
                                                Label("Delete", systemImage: "trash")
                                            }
                                        }
                                        .padding(.vertical, -5)
                                    
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                }

                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        AddButton {
                            isShowingAddSheet = true
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, 20)
                    }
                }
            }
            .navigationTitle("Today")
            .sheet(isPresented: $isShowingAddSheet) {
                AddTaskView(viewModel: viewModel)
                    .presentationDetents([.height(260)])
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

