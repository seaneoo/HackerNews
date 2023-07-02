//
//  FeedView.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/2/23.
//

import SwiftUI

enum StoryType {
    case top, best, new

    func image() -> String {
        switch self {
        case .top:
            return "star"
        case .best:
            return "trophy"
        case .new:
            return "clock"
        }
    }
}

struct FeedView: View {
    @State private var storyType: StoryType = StoryType.top

    var body: some View {
        NavigationStack {
            VStack {
            }
            .navigationTitle("Stories")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button {
                            storyType = StoryType.top
                        } label: {
                            Label("Top", systemImage: StoryType.top.image())
                        }

                        Button {
                            storyType = StoryType.best
                        } label: {
                            Label("Best", systemImage: StoryType.best.image())
                        }

                        Button {
                            storyType = StoryType.new
                        } label: {
                            Label("New", systemImage: StoryType.new.image())
                        }
                    } label: {
                        Image(systemName: storyType.image())
                    }
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
