//
//  Navigation-Modifier.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/16.
//

import SwiftUI

struct DefaultNavigation: ViewModifier {

    var title: String

    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .toolbarBackground(Color(uiColor: .systemBackground), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct BackButton: ViewModifier {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left") // 화살표 Image
                                .aspectRatio(contentMode: .fit)
                                .padding(.trailing, -5)
                            Text("뒤로가기")
                        }
                    }
                }
            }
    }
}
