//
//  HackerNewsApp.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/2/23.
//

import SwiftUI

@main
struct HackerNewsApp: App {
    @StateObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
                .alert(appState.alertTitle, isPresented: $appState.isShowingAlert) {
                    Button(role: .cancel) {
                        appState.isShowingAlert.toggle()
                    } label: {
                        Text("Close")
                    }
                } message: {
                    Text(appState.alertMessage)
                }
        }
    }
}
