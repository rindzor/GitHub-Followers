//
//  Follower.swift
//  GHFollowers
//
//  Created by Sean Allen on 07.08.2020.
//  Copyright © 2020 Vladimir Drozdin. All rights reserved.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
}
