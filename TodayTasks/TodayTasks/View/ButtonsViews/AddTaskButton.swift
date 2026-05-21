//
//  AddTaskButton.swift
//  TodayTasks
//
//  Created by Jay on 5/21/26.
//

import SwiftUI

struct AddTaskButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text("Add Task")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(Color.button)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
    }
}

#Preview {
    AddTaskButton(action: {})
        .padding()
}
