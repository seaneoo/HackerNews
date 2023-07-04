//
//  StoryItemView.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/3/23.
//

import SwiftUI

struct StoryItemView: View {
    var item: Item

    @Environment(\.openURL) private var openURL

    init(item: Item) {
        self.item = item
    }

    var body: some View {
        contentView
    }

    @ViewBuilder
    private var contentView: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let url = item.url {
                LinkPreviewView(url: URL(string: url))
            }

            Text("\(item.title ?? "undetermined")")
                .font(.headline)

            if let by = item.by {
                Button {
                    // TODO: go to user profile view
                } label: {
                    Text("by \(by)").font(.subheadline)
                        .foregroundColor(.primary)
                }
            }

            ItemActionBarView(item: item, size: .small)
        }
        .padding()
        .contextMenu(menuItems: {
            Button {
                // TODO: upvote the item
            } label: {
                Label("Upvote", systemImage: "arrow.up")
            }

            Button {
                // TODO: go to the item details view
            } label: {
                Label("Comments", systemImage: "bubble.right")
            }

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
        })
        .swipeActions(edge: .leading) {
            // upvote the item when swiping right
            Button {
                print("upvote")
            } label: {
                Label("Upvote", systemImage: "arrow.up")
            }
            .tint(.orange)
        }
        .swipeActions(edge: .trailing) {
            // save the item when swiping left
            Button {
                print("save")
            } label: {
                Label("Save", systemImage: "bookmark")
            }
            .tint(.green)
        }
    }
}

struct StoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        StoryItemView(item: ItemStoryPreview)
    }
}
