//
//  UserModel.swift
//  Hanbyulstagram
//
//  Created by Jeong Deokho on 2024/04/17.
//

import Foundation

struct UserModel: Identifiable, Codable {
    var id: String
    var userName: String
    var profileImageUrlString: String
    var description: String?
}

extension UserModel {
    static var mockModels: [UserModel] = [
        .init(id: NSUUID().uuidString, userName: "정한별", profileImageUrlString: "한별이", description: "월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월월"),
        .init(id: NSUUID().uuidString, userName: "정세별", profileImageUrlString: "한별이3", description: "졸리다"),
        .init(id: NSUUID().uuidString, userName: "정네별", profileImageUrlString: "한별이4", description: "벚꽃 이쁘다"),
        .init(id: NSUUID().uuidString, userName: "정두별", profileImageUrlString: "한별이2")
    ]
}
