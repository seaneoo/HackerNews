//
//  HNModels.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/2/23.
//

import Foundation

// List of unique ids representing items
typealias Stories = [Int]

// https://github.com/HackerNews/API#items
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

// https://github.com/HackerNews/API#users
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

let ItemStoryPreview = Item(id: 36575003, type: "story", by: "pseudolus", time: 1688400663, kids: [36575485, 36575492, 36575655, 36575512, 36575477, 36575738, 36575594, 36575478, 36575613, 36575688, 36575629, 36575484, 36575703, 36575668, 36575483, 36575660], url: "https://www.washingtonpost.com/technology/2023/07/01/amazon-goodreads-elizabeth-gilbert/", score: 61, title: "Goodreads was the future of book reviews. Then Amazon bought it", descendants: 26)
