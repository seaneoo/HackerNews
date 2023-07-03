//
//  StoryView.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/2/23.
//

import SwiftUI

struct ItemView: View {
    var id: Int

    @State private var item: Item?
    @State private var itemType: String = ""

    init(id: Int) {
        self.id = id
    }

    @MainActor
    var body: some View {
        contentView
    }

    @MainActor
    @ViewBuilder
    private var contentView: some View {
        if let item {
            if itemType == "story" {
                StoryItemView(item: item)
            }
        } else {
            progressView
        }
    }

    @MainActor
    private var progressView: some View {
        ProgressView {
            Text("Loading")
        }.task {
            do {
                item = try await getItem()
                itemType = item?.type ?? "UNIDENTIFIED_TYPE"
            } catch {
                print(error) // change this to be proper logging later
            }
        }
    }

    func getItem() async throws -> Item {
        let url = "https://hacker-news.firebaseio.com/v0/item/\(String(id)).json"
        return try await APIService.shared.fetchData(for: Item.self, from: url)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(id: 36543894)
    }
}
