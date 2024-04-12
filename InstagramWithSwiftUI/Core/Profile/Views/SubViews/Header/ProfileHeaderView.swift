//
//  ProfileHeaderView.swift
//  InstagramWithSwiftUI
//
//  Created by Jeong Deokho on 2024/04/12.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    // MARK: - Constants
    
    private enum TextConstants {
        static let profileEdit = "프로필 편집"
        static let posts = "게시물"
        static let followers = "팔로워"
        static let following = "팔로잉"
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack() {
            HStack {
                Image("Hanbyoul")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(.circle)
                
                Spacer()
                
                HStack(spacing: 8) {
                    ProfileHeaderStatView(value: 3, title: TextConstants.posts)
                    ProfileHeaderStatView(value: 3, title: TextConstants.followers)
                    ProfileHeaderStatView(value: 3, title: TextConstants.following)
                }
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text("정한별")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.bottom, 5)

                Text("월월월월월월월월월월월월월월월월월월월월")
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, maxHeight: 70, alignment: .leading)
            .padding(.horizontal)
            .padding(.bottom, 5)

            Button {
                
            } label: {
                Text(TextConstants.profileEdit)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundStyle(.foreground)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6).stroke(.gray, lineWidth: 1)
                    }
                
            }
            
            Divider()
        }
    }
}

#Preview {
    ProfileHeaderView()
}
