//
//  AppState.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/5/23.
//

import Foundation

class AppState: ObservableObject {
    @Published var isShowingAlert: Bool = false
    @Published var alertTitle: String = ""
    @Published var alertMessage: String = ""
}
