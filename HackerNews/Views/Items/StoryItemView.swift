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
        VStack(alignment: .leading) {
            Text("\(item.title ?? "undetermined")")
                .font(.headline)
                .padding([.bottom], 2)

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

    // TODO: move into sep. file
    func extractDomainName(from urlString: String) -> String? {
        if let url = URL(string: urlString), let host = url.host {
            return host
        }
        return nil
    }

    // TODO: move into sep. file
    func formatUnixTime(from time: Int) -> String? {
        let date = Date(timeIntervalSince1970: TimeInterval(time))
        let df = DateComponentsFormatter()
        df.unitsStyle = .full
        df.maximumUnitCount = 1
        df.allowedUnits = [.year, .month, .weekOfMonth, .day, .hour, .minute, .second]
        df.collapsesLargestUnit = true
        return df.string(from: date, to: Date())
    }
}

struct StoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        StoryItemView(item: ItemStoryPreview)
    }
}
