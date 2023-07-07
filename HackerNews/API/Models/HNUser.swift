//
//  HNUser.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/7/23.
//

import Foundation

struct User: Codable {
    var id: String // the user's unique username
    var created: Int // the creation date and time of the user, in Unix time
    var karma: Int // the user's karma
    var about: String? // the user's optional description (HTML)
    var submitted: [Int]? // the user's stories, polls, and comments

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        created = try container.decode(Int.self, forKey: .created)
        karma = try container.decode(Int.self, forKey: .karma)
        about = try container.decodeIfPresent(String.self, forKey: .about)
        submitted = try container.decodeIfPresent([Int].self, forKey: .submitted)
    }

    init(id: String, created: Int, karma: Int, about: String? = nil, submitted: [Int]? = nil) {
        self.id = id
        self.created = created
        self.karma = karma
        self.about = about
        self.submitted = submitted
    }
}

extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
}
