//
//  PostModel.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/04/17.
//

import Foundation

struct PostModel: Identifiable, Codable {
    let id: String
    let userName: String
    let caption: String
    let userImageUrl: String
    let feedImageUrl: String
    let likesCount: Int
    let timestamp: Date
}

extension PostModel {
    static let mockModels: [PostModel] = [
        .init(id: UUID().uuidString,
              userName: "정한별",
              caption: "월월월월어월월",
              userImageUrl: "한별이2",
              feedImageUrl: "피드이미지",
              likesCount: 300000, timestamp: Date()),
        .init(id: UUID().uuidString,
              userName: "정두별",
              caption: "모든 텍스트를 배치할 수 있으므로 ContentView높이는 가변적이므로 콘텐츠 주변의 항목이 올바르게 배치되도록 이를 계산해야 합니다. 이 높이 계산이 어떻게 작동하는지 궁금하다면 Majid가 포함된 Swift에 훌륭한 설명이 있습니다 .이제 실제로 뷰를 레이아웃해야 합니다 ZStack. 해당 코드는 다음과 같습니다. 와! 그것을 분석해 봅시다. 먼저 우리는 zStackViews(_:)메소드 호출을 우리의 ZStack및 정의에 추가합니다 zStackViews(_:). 내에서 zStackViews19행의 현재 수평 및 수직 위치를 추적합니다. 그런 다음 함수 ForEach에 의해 생성된 콘텐츠가 포함된 뷰를 반환합니다 forEachView(_:). forEachView단일 ContentText또는 Link보기에 대한 레이아웃을 생성합니다.",
              userImageUrl: "한별이3",
              feedImageUrl: "피드이미지2",
              likesCount: 33450302021, timestamp: Date())
    ]
}
