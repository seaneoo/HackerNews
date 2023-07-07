//
//  AppState.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/5/23.
//

import Foundation

class AppState: ObservableObject {
    // MARK: Alert message box

    @Published var isShowingAlert: Bool = false
    @Published var alertTitle: String = ""
    @Published var alertMessage: String = ""

    // MARK: Informational toast

    @Published var isShowingToast: Bool = false
    @Published var toastMessage: String = ""

    // MARK: Error toast

    @Published var isShowingError: Bool = false
    @Published var errorMessage: String = ""
}
