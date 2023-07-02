//
//  ContentView.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "newspaper")
                            .font(.system(size: 24))
                    }

                Text("Search")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 24))
                    }

                Text("Account")
                    .tabItem {
                        Image(systemName: "person")
                            .font(.system(size: 24))
                    }

                Text("Settings")
                    .tabItem {
                        Image(systemName: "gear")
                            .font(.system(size: 24))
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
