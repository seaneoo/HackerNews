//
//  Double.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/7/23.
//

import Foundation

extension Double {
    func abbreviate() -> String {
        if self >= 1000000 {
            return String(format: "%.1fM", self / 1000000)
        } else if self >= 1000 {
            return String(format: "%.1fK", self / 1000)
        }
        return String(self)
    }
}
