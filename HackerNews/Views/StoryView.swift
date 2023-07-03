//
//  StoryView.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/2/23.
//

import SwiftUI

struct StoryView: View {
    var id: Int

    @State private var item: Item?

    init(id: Int) {
        self.id = id
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(item?.title ?? "NULL").font(.headline)

            Text("by \(item?.by ?? "NULL")").font(.caption)
        }
        .task {
            do {
                item = try await APIService.shared.fetchData(for: Item.self, from: "https://hacker-news.firebaseio.com/v0/item/\(String(self.id)).json")
            } catch {
                print(error)
            }
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(id: 36566999)
    }
}
