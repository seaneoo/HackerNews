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
    // Global app state, controls the alert box(es) and toast(s)
    @StateObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
                // Alert message box
                .alert(appState.alertTitle, isPresented: $appState.isShowingAlert) {
                    Button(role: .cancel) {
                        appState.isShowingAlert.toggle()
                    } label: {
                        Text("Close")
                    }
                } message: {
                    Text(appState.alertMessage)
                }
                // Informational toast
                .toast(isPresenting: $appState.isShowingToast) {
                    AlertToast(displayMode: .hud, type: .regular, title: appState.toastMessage)
                }
                // Error toast
                .toast(isPresenting: $appState.isShowingError) {
                    AlertToast(displayMode: .alert, type: .error(.red), title: appState.errorMessage)
                }
        }
    }
}
