//
//  TimeParser.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/3/23.
//

import Foundation
import SwiftUI

func convertUnixTime(from timestamp: Int) -> Date {
    return Date(timeIntervalSince1970: TimeInterval(timestamp))
}

func formatDate(from date: Date) -> String {
    AppConstants.dateFormatter.dateStyle = .long
    AppConstants.dateFormatter.timeStyle = .long
    return AppConstants.dateFormatter.string(from: date)
}

func getRelativeTimeFromNow(from date: Date) -> String {
    AppConstants.relativeDateFormatter.dateTimeStyle = .numeric
    AppConstants.relativeDateFormatter.unitsStyle = .short
    AppConstants.relativeDateFormatter.formattingContext = .standalone
    AppConstants.relativeDateFormatter.calendar = .autoupdatingCurrent
    let value = String(AppConstants.relativeDateFormatter.localizedString(for: date, relativeTo: .now))
    return value.hasPrefix("in") ? "now" : value
}

func abbrNumber(from number: Int) -> String {
    let num = Double(number)
    if num >= 1000000 {
        return String(format: "%.1fM", num / 1000000)
    } else if num >= 1000 {
        return String(format: "%.1fK", num / 1000)
    }
    return String(number)
}
