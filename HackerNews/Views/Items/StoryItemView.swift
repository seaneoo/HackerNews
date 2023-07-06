//
//  StoryItemView.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/3/23.
//

import SwiftUI

struct StoryItemView: View {
    @ObservedObject private var vm: ItemViewModel
    @Environment(\.openURL) private var openURL
    @EnvironmentObject var appState: AppState

    var item: Item

    init(item: Item) {
        self.item = item
        vm = ItemViewModel(item: self.item)
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
                .font(AppConstants.CFont.Headline)

            if let by = item.by {
                Button {
                    // TODO: go to user profile view
                    appState.toastMessage = "Test"
                    appState.isShowingToast.toggle()
                } label: {
                    Text("by \(by)").font(AppConstants.CFont.Small)
                        .foregroundColor(.primary)
                }
            }

            ItemActionBarView(item: item, size: .small)
        }
        .padding()
        .contextMenu(menuItems: {
            Button {
                if !vm.upvote() {
                    print("did not upvote")
                }
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
                if !vm.save() {
                    print("did not save")
                }
            } label: {
                Label("Save", systemImage: "bookmark")
            }
        })
        .swipeActions(edge: .leading) {
            Button {
                if !vm.upvote() {
                    print("did not upvote")
                }
            } label: {
                Label("Upvote", systemImage: "arrow.up")
            }
            .tint(.orange)
        }
        .swipeActions(edge: .trailing) {
            Button {
                if !vm.save() {
                    print("did not save")
                }
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
