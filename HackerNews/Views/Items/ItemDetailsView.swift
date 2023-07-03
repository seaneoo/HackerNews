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
        VStack(alignment: .leading) {
            Text(String(item.title ?? "")).font(.title2)

            Divider()

            ItemActionBarView(item: item, size: .large)

            Spacer()
        }
    }
}

struct ItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailsView(item: ItemStoryPreview)
    }
}
