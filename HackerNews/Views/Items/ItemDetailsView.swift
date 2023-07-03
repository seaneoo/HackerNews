//
//  ItemDetailsView.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/3/23.
//

import SwiftUI

struct ItemDetailsView: View {
    var item: Item

    init(item: Item) {
        self.item = item
    }

    var body: some View {
        contentView
    }

    @ViewBuilder
    private var contentView: some View {
        VStack {
            Text(String(item.title ?? "")).font(.title2)

            Spacer()
        }
    }
}

struct ItemDetailsView_Previews: PreviewProvider {
    static let previewStoryItem = Item(id: 36575003, type: "story", by: "pseudolus", time: 1688400663, kids: [36575485, 36575492, 36575655, 36575512, 36575477, 36575738, 36575594, 36575478, 36575613, 36575688, 36575629, 36575484, 36575703, 36575668, 36575483, 36575660], url: "https://www.washingtonpost.com/technology/2023/07/01/amazon-goodreads-elizabeth-gilbert/", score: 61, title: "Goodreads was the future of book reviews. Then Amazon bought it", descendants: 26)

    static var previews: some View {
        ItemDetailsView(item: previewStoryItem)
    }
}
