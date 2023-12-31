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

    @ViewBuilder
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(0 ..< stories.count, id: \.self) { index in
                        ItemView(id: stories[index])
                            .listRowInsets(EdgeInsets())
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Stories")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button {
                            storyType = StoryType.top
                            AppConstants.feedbackGenerator.impactOccurred()
                        } label: {
                            Label("Top", systemImage: StoryType.top.image())
                        }

                        Button {
                            storyType = StoryType.best
                            AppConstants.feedbackGenerator.impactOccurred()
                        } label: {
                            Label("Best", systemImage: StoryType.best.image())
                        }

                        Button {
                            storyType = StoryType.new
                            AppConstants.feedbackGenerator.impactOccurred()
                        } label: {
                            Label("New", systemImage: StoryType.new.image())
                        }
                    } label: {
                        Image(systemName: storyType.image())
                    }
                }
            }
        }
        .refreshable {
            stories = await getStories()
        }
        .task {
            stories = await getStories()
        }
    }

    func getStories() async -> Stories {
        do {
            let data = try await APIService.shared.fetchData(for: Stories.self, from: "https://hacker-news.firebaseio.com/v0/topstories.json")
            return Array(data.prefix(10))
        } catch {
            print(error)
        }
        return []
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
