//
//  CelebrationView.swift
//  TodayTasks
//
//  Created by Jay on 5/21/26.
//

import SwiftUI

struct CelebrationView: View {
    @Binding var isShowing: Bool
    @State private var scale: CGFloat = 0.4
    @State private var opacity: Double = 0
    @State private var rotation: Double = -20

    var body: some View {
        ZStack {
            Color.black.opacity(opacity * 0.35)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Image(systemName: "checkmark.seal.fill")
                    .font(.system(size: 96, weight: .bold))
                    .foregroundStyle(.green)
                    .rotationEffect(.degrees(rotation))

                Text("Nice work!")
                    .font(.title2.bold())
                    .foregroundStyle(.primary)
            }
            .padding(32)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24, style: .continuous))
            .scaleEffect(scale)
            .opacity(opacity)
        }
        .allowsHitTesting(false)
        .onAppear {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.55)) {
                scale = 1.0
                opacity = 1.0
                rotation = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                withAnimation(.easeOut(duration: 0.25)) {
                    opacity = 0
                    scale = 0.8
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    isShowing = false
                }
            }
        }
    }
}
