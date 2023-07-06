//
//  HackerNewsApp.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/2/23.
//

import AlertToast
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
                .toast(isPresenting: $appState.isShowingToast) {
                    AlertToast(displayMode: .hud, type: .regular, title: appState.toastMessage)
                }
        }
    }
}
