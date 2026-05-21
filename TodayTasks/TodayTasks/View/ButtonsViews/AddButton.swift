//
//  AddButton.swift
//  TodayTasks
//
//  Created by Jay on 5/20/26.
//

import SwiftUI

struct AddButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(.white)
                .frame(width: 56, height: 56)
                .background(Color.button)
                .clipShape(Circle())
                .shadow(radius: 4, y: 2)
        }
    }
}

#Preview {
    AddButton(action: {})
}
