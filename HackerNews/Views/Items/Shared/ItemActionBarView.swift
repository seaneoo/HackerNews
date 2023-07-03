//
//  ItemActionBarView.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/3/23.
//

import SwiftUI

struct ItemActionBarView: View {
    var item: Item
    var size: ActionBarSize

    private var fontSize: Font

    init(item: Item, size: ActionBarSize) {
        self.item = item
        self.size = size

        fontSize = self.size == .large ? .body : .footnote
    }

    var body: some View {
        contentView
    }

    @ViewBuilder
    private var contentView: some View {
        HStack(spacing: 20) {
            actionBarScore
            actionBarComments
            if item.time != nil { actionBarTime }
            actionBarMore
        }
        .padding([.top], 2)
    }

    private var actionBarScore: some View {
        Button {
            // TODO: upvote the item
        } label: {
            HStack {
                Image(systemName: "arrow.up")
                Text(abbrNumber(from: item.score ?? 0))
            }
            .foregroundColor(.primary)
            .font(self.fontSize)
        }
    }

    private var actionBarComments: some View {
        Button {
            // TODO: go to the item details view
        } label: {
            HStack {
                Image(systemName: "bubble.right")
                Text(String(item.descendants ?? 0))
            }
            .foregroundColor(.primary)
            .font(self.fontSize)
        }
    }

    private var actionBarTime: some View {
        Button {
            // TODO: display full time via toast
        } label: {
            HStack {
                Image(systemName: "clock")
                Text(getRelativeTimeFromNow(from: convertUnixTime(from: item.time ?? 0)))
            }
            .foregroundColor(.primary)
            .font(self.fontSize)
        }
    }

    private var actionBarMore: some View {
        Menu {
            Button {
                // TODO: open share sheet
            } label: {
                Label("Share", systemImage: "square.and.arrow.up")
            }

            Button {
                // TODO: bookmark the item
            } label: {
                Label("Bookmark", systemImage: "bookmark")
            }
        } label: {
            Image(systemName: "ellipsis")
                .foregroundColor(.primary)
                .font(self.fontSize)
        }
    }
}

enum ActionBarSize {
    case small, large
}

struct ItemActionBarView_Previews: PreviewProvider {
    static var previews: some View {
        ItemActionBarView(item: ItemStoryPreview, size: .large)
    }
}
