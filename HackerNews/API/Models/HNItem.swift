//
//  ItemModel.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/7/23.
//

import Foundation

struct Item: Codable {
    var id: Int // the item's unique id
    var deleted: Bool? // true, if the item is deleted
    var type: String? // the type of the item (job, story, comment, poll, or pollopt)
    var by: String? // the username of the item's author
    var time: Int? // the creation date and time of the item, in Unix time
    var text: String? // the comment, story, or poll text (HTML)
    var dead: Bool? // true, if the item is dead
    var parent: Int? // the comment's parent (an item id)
    var poll: Int? // the pollopt's associated poll
    var kids: [Int]? // the ids of the item's comments
    var url: String? // the url of the story
    var score: Int? // the story's score
    var title: String? // the title of the story, poll, or job (HTML)
    var parts: [Int]? // a list of related pollopts
    var descendants: Int? // the total comment count

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        deleted = try container.decodeIfPresent(Bool.self, forKey: .deleted)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        by = try container.decodeIfPresent(String.self, forKey: .by)
        time = try container.decodeIfPresent(Int.self, forKey: .time)
        text = try container.decodeIfPresent(String.self, forKey: .text)
        dead = try container.decodeIfPresent(Bool.self, forKey: .dead)
        parent = try container.decodeIfPresent(Int.self, forKey: .parent)
        poll = try container.decodeIfPresent(Int.self, forKey: .poll)
        kids = try container.decodeIfPresent([Int].self, forKey: .kids)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        score = try container.decodeIfPresent(Int.self, forKey: .score)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        parts = try container.decodeIfPresent([Int].self, forKey: .parts)
        descendants = try container.decodeIfPresent(Int.self, forKey: .descendants)
    }

    init(id: Int, deleted: Bool? = nil, type: String? = nil, by: String? = nil, time: Int? = nil, text: String? = nil, dead: Bool? = nil, parent: Int? = nil, poll: Int? = nil, kids: [Int]? = nil, url: String? = nil, score: Int? = nil, title: String? = nil, parts: [Int]? = nil, descendants: Int? = nil) {
        self.id = id
        self.deleted = deleted
        self.type = type
        self.by = by
        self.time = time
        self.text = text
        self.dead = dead
        self.parent = parent
        self.poll = poll
        self.kids = kids
        self.url = url
        self.score = score
        self.title = title
        self.parts = parts
        self.descendants = descendants
    }
}

extension Item: Equatable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.id == rhs.id
    }
}
