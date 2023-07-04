//
//  ItemViewModel.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/4/23.
//

import Foundation
import os

final class ItemViewModel: ObservableObject {
    private static let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: ItemViewModel.self)
    )

    var id: Int?
    var item: Item?

    init(id: Int) {
        self.id = id
    }

    init(item: Item) {
        self.item = item
    }

    func loadItem() async -> Item? {
        guard let id = id else { return nil }
        let url = "https://hacker-news.firebaseio.com/v0/item/\(String(id)).json"

        do {
            return try await APIService.shared.fetchData(for: Item.self, from: url)
        } catch {
            Self.logger.warning("\(error.localizedDescription, privacy: .public)")
            return nil
        }
    }

    func upvote() -> Bool {
        // TODO: upvote the item
        return false
    }

    func save() -> Bool {
        // TODO: save the item
        return false
    }
}
