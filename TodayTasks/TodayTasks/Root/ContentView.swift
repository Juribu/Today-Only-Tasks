//
//  ContentView.swift
//  TodayTasks
//
//  Created by Jay on 5/20/26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: TodayViewModel

    var body: some View {
        TabView {
            TodayView(viewModel: viewModel)
                .tabItem {
                    Label("Today", systemImage: "checklist")
                }

            ExpiredView(viewModel: viewModel)
                .tabItem {
                    Label("Expired", systemImage: "clock.badge.xmark")
                }
        }
    }
}

