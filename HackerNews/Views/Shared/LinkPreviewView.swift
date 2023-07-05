//
//  LinkPreviewView.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/3/23.
//

import LinkPresentation
import SwiftUI

struct LinkPreviewView: View {
    var url: URL?

    init(url: URL? = nil) {
        self.url = url
    }

    var faviconUrl: URL? {
        guard
            let host = url?.host(),
            let image = URL(string: "https://www.google.com/s2/favicons?sz=64&domain=\(host)")
        else {
            return nil
        }
        return image
    }

    @ViewBuilder
    var body: some View {
        if url != nil {
            contentView
        }
    }

    @ViewBuilder
    private var contentView: some View {
        HStack {
            if let faviconUrl {
                AsyncImage(url: faviconUrl) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15, height: 15)
                } placeholder: {
                    Image(systemName: "globe")
                        .frame(width: 20, height: 20)
                }
            }

            if let host = url?.host() {
                Text(host).font(Constants.CFont.XSmall)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct LinkPreviewView_Previews: PreviewProvider {
    static let url = URL(string: "https://github.com/apple/swift")

    static var previews: some View {
        LinkPreviewView(url: url!)
    }
}
