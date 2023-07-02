//
//  ContentView.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "newspaper")
                        .font(.system(size: 24))
                }

            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 24))
                }

            Text("Account")
                .tabItem {
                    Image(systemName: "person")
                        .font(.system(size: 24))
                }

            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                        .font(.system(size: 24))
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
