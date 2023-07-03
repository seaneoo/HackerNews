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
    @State private var stories: Stories = []

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    ForEach(0 ..< stories.count, id: \.self) { index in
                        StoryView(id: stories[index])
                    }
                }
                .padding(20.0)
            }
            .navigationTitle("Stories")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button {
                            storyType = StoryType.top
                            hapticFeedback()
                        } label: {
                            Label("Top", systemImage: StoryType.top.image())
                        }

                        Button {
                            storyType = StoryType.best
                            hapticFeedback()
                        } label: {
                            Label("Best", systemImage: StoryType.best.image())
                        }

                        Button {
                            storyType = StoryType.new
                            hapticFeedback()
                        } label: {
                            Label("New", systemImage: StoryType.new.image())
                        }
                    } label: {
                        Image(systemName: storyType.image())
                    }
                }
            }.task {
                do {
                    stories = try await APIService.shared.fetchData(for: Stories.self, from: "https://hacker-news.firebaseio.com/v0/topstories.json")
                    stories = Array(stories[0 ... 9])
                } catch {
                    print(error)
                }
            }
        }
    }

    func hapticFeedback() {
        let impact = UIImpactFeedbackGenerator(style: .medium)
        impact.impactOccurred()
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
