//
//  CustomLoadingView.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/04/18.
//

import SwiftUI

final class WindowIsLoading: ObservableObject {
    static let shared = WindowIsLoading()

    @Published var isLoading: Bool = false
}


struct CustomLoadingView: View {

    private let lineWidth: CGFloat = 15

    @State var isLoading: Bool = false

    public var body: some View {
            ZStack {
                Rectangle()
                    .foregroundStyle(Color(uiColor: .systemBackground.withAlphaComponent(0.5)))

                Circle()
                    .stroke(Color(uiColor: .systemBackground.withAlphaComponent(0.5)), lineWidth: lineWidth)
                    .opacity(0.3)
                    .frame(width: 100, height: 100)
                Circle()
                    .trim(from: 0, to: 0.25)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color(uiColor: .label.withAlphaComponent(0.7)))
                    .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                    .animation(
                        Animation.linear(duration: 1.2).repeatForever(autoreverses: false),
                        value: isLoading
                    )
                    .frame(width: 100, height: 100)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                isLoading = true
            }
            .onDisappear {
                isLoading = false
            }
    }
}

#Preview {
    return CustomLoadingView()
}
