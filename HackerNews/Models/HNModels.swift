//
//  HNModels.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/2/23.
//

import Foundation

typealias Stories = [Int]

struct Item: Codable {
    var by: String
    var descendants: Int
    var id: Int
    var kids: [Int]
    var score: Int
    var time: Int
    var title: String
    var type: String
    var url: String
}
