//
//  AppConstants.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/4/23.
//

import Foundation
import SwiftUI

struct AppConstants {
    static let urlSession: URLSession = URLSession(configuration: .default)
    static let jsonDecoder: JSONDecoder = JSONDecoder()

    static let dateFormatter: DateFormatter = DateFormatter()
    static let relativeDateFormatter: RelativeDateTimeFormatter = RelativeDateTimeFormatter()

    static let feedbackGenerator: UIImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)

    struct CFont {
        static let Body = Font.body
        static let Headline = Font.headline
        static let Small = Font.system(size: 15)
        static let XSmall = Font.system(size: 13)
    }
}
