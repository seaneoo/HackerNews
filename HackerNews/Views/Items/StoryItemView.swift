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
            if let url = extractDomainName(from: item.url ?? "") {
                Text("\(url)")
                    .font(.caption)
                    .textCase(.uppercase)
                    .padding([.bottom], 2)
            }

            Text("\(item.title ?? "undetermined")")
                .font(.headline)
                .padding([.bottom], 2)

            if let by = item.by, let time = item.time {
                Text("\(by) • \(formatUnixTime(from: time) ?? "") ago").font(.subheadline)
            }

            HStack(spacing: 20) {
                score
                comments
            }
            .padding([.top], 2)
        }
        .onTapGesture {
            // on tap, open the item's url in the default browser
            if let url = item.url {
                openURL(URL(string: url)!)
            }
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

    private var score: some View {
        HStack {
            Image(systemName: "arrow.up")
                .frame(width: 20, height: 20)
                .foregroundColor(.orange)
            Text(String(item.score ?? 0)).font(.subheadline)
        }
        .onTapGesture {
            // on tap, upvote the item
            print("upvote")
        }
    }

    private var comments: some View {
        HStack {
            Image(systemName: "text.bubble")
                .frame(width: 20, height: 20)
            Text(String(item.descendants ?? 0)).font(.subheadline)
        }
        .onTapGesture {
            // on tap, view the comments of the item (i.e., item details)
            print("comments")
        }
    }

    func extractDomainName(from urlString: String) -> String? {
        if let url = URL(string: urlString), let host = url.host {
            return host
        }
        return nil
    }

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
    static let previewStoryItem = Item(id: 36575003, type: "story", by: "pseudolus", time: 1688400663, kids: [36575485, 36575492, 36575655, 36575512, 36575477, 36575738, 36575594, 36575478, 36575613, 36575688, 36575629, 36575484, 36575703, 36575668, 36575483, 36575660], url: "https://www.washingtonpost.com/technology/2023/07/01/amazon-goodreads-elizabeth-gilbert/", score: 61, title: "Goodreads was the future of book reviews. Then Amazon bought it", descendants: 26)

    static var previews: some View {
        StoryItemView(item: previewStoryItem)
    }
}
