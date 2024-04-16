//
//  SearchView.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/16.
//

import SwiftUI

struct SearchView: View {

    @State var searchText: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(1...20, id: \.self) { count in
                            HStack {
                                Image("Hanbyoul")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 45, height: 45)
                                    .clipShape(.circle)

                                VStack(alignment: .leading) {
                                    Text("정한별")
                                        .fontWeight(.semibold)
                                    Text("월월월월월월월월월월월월월월월월월월월월월월월월월월월월")
                                }
                                .font(.subheadline)
                                .frame(height: 0)

                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top, 10)
                }
                .searchable(text: $searchText, prompt: "닉네임 검색")
            }
            .modifier(DefaultNavigation(title: "검색"))
        }

    }
}

#Preview {
    SearchView()
}
