//
//  StoryView.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/2/23.
//

import SwiftUI

struct ItemView: View {
    @ObservedObject private var vm: ItemViewModel
    @State private var item: Item?
    @State private var itemType: String?

    var id: Int

    init(id: Int) {
        self.id = id
        vm = ItemViewModel(id: self.id)
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
        ProgressView()
            .task {
                item = await vm.loadItem()
                if let type = item?.type {
                    itemType = type
                }
            }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(id: 36543894)
    }
}
