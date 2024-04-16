//
//  LogInView.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/16.
//

import SwiftUI

struct LogInView: View {

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("한별이")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(.circle)
                Text("Hanbyulstagram")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .padding(.bottom, 20)

                AppleLoginButton()
                Spacer()
                Divider().padding()
            }
        }
    }
}

#Preview {
    LogInView()
}
