//
//  ContentView.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 1

    var handler: Binding<Int> { Binding(
        get: { self.selectedTab },
        set: {
            self.selectedTab = $0
        }
    ) }

    var body: some View {
        TabView(selection: handler) {
            FeedView()
                .tabItem {
                    Image(systemName: "newspaper")
                        .font(.system(size: 24))
                }.tag(1)

            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 24))
                }.tag(2)

            AccountView()
                .tabItem {
                    Image(systemName: "person")
                        .font(.system(size: 24))
                }.tag(3)

            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                        .font(.system(size: 24))
                }.tag(4)
        }.onChange(of: selectedTab) { _ in
            AppConstants.feedbackGenerator.impactOccurred()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
