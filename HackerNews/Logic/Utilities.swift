//
//  TimeParser.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/3/23.
//

import Foundation
import SwiftUI

let dateFormatter: DateFormatter = DateFormatter()

let relativeDateFormatter: RelativeDateTimeFormatter = RelativeDateTimeFormatter()

func convertUnixTime(from timestamp: Int) -> Date {
    return Date(timeIntervalSince1970: TimeInterval(timestamp))
}

func getRelativeTimeFromNow(from date: Date) -> String {
    relativeDateFormatter.dateTimeStyle = .numeric
    relativeDateFormatter.unitsStyle = .short
    relativeDateFormatter.formattingContext = .standalone
    relativeDateFormatter.calendar = .autoupdatingCurrent
    let value = String(relativeDateFormatter.localizedString(for: date, relativeTo: .now).dropLast(5))
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

func hapticFeedback() {
    let impact = UIImpactFeedbackGenerator(style: .medium)
    impact.impactOccurred()
}
