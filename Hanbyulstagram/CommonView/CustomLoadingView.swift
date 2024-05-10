//
//  CustomLoadingView.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/04/18.
//

import SwiftUI

struct CustomLoadingView: View {

    @State private var degrees: Double = 0
    private let lineWidth: CGFloat = 15

    public var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color(uiColor: .systemBackground.withAlphaComponent(0.5)))
                .edgesIgnoringSafeArea(.all) // SafeArea를 무시하도록 수정

            Circle()
                .stroke(Color(uiColor: .systemBackground.withAlphaComponent(0.5)), lineWidth: lineWidth)
                .opacity(0.3)
                .frame(width: 100, height: 100)

            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color(uiColor: .label.withAlphaComponent(0.7)))
                .rotationEffect(Angle(degrees: self.degrees))
                .animation(Animation.linear(duration: 1.2).repeatForever(autoreverses: false),
                           value: true)
                .frame(width: 100, height: 100)
                .onAppear {
                    withAnimation(Animation.linear(duration: 1.2).repeatForever(autoreverses: false)) {
                        self.degrees = 360
                    }
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
