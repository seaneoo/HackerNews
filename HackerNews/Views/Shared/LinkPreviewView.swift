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

    @State private var metadata: LPLinkMetadata?
    @State private var icon: UIImage?

    init(url: URL? = nil) {
        self.url = url
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
            if let icon {
                Image(uiImage: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                    .clipShape(Circle())
            } else {
                Image(systemName: "globe")
                    .frame(width: 15, height: 15)
            }

            if let host = url?.host() {
                Text(host).font(.footnote)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .task {
            do {
                let metadataProvider = LPMetadataProvider()
                metadata = try await metadataProvider.startFetchingMetadata(for: url!)

                metadata?.iconProvider?.loadDataRepresentation(for: .image, completionHandler: { data, error in
                    if let data {
                        icon = UIImage(data: data)
                    } else if let error {
                        print(error)
                    }
                })
            } catch {
                print("Error fetching metadata \(error)")
            }
        }
    }
}

struct LinkPreviewView_Previews: PreviewProvider {
    static let url = URL(string: "https://github.com/apple/swift")

    static var previews: some View {
        LinkPreviewView(url: url!)
    }
}
