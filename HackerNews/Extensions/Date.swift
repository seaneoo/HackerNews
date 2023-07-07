//
//  Date.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/7/23.
//

import Foundation

extension Date {
    func fromUnix(from ts: Int) -> Date {
        return Date(timeIntervalSince1970: TimeInterval(ts))
    }

    func format() -> String {
        AppConstants.dateFormatter.dateStyle = .long
        AppConstants.dateFormatter.timeStyle = .long
        return AppConstants.dateFormatter.string(from: self)
    }

    func getRelativeTime(from date: Date) -> String {
        AppConstants.relativeDateFormatter.unitsStyle = .full
        let value = String(AppConstants.relativeDateFormatter.localizedString(for: self, relativeTo: date))
        return value.hasPrefix("in") ? "now" : value
    }
}
