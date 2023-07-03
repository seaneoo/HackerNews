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
    @State private var image: UIImage?

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
        VStack {
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }

//            VStack {
//                if let title = metadata?.title {
//                    Text(title)
//                        .fontWeight(.bold)
//                        .font(.footnote)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .lineLimit(1)
//                }
//
//                if let absoluteString = url?.absoluteString {
//                    Text(absoluteString)
//                        .font(.footnote)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .lineLimit(1)
//                }
//            }
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

                metadata?.imageProvider?.loadDataRepresentation(for: .image, completionHandler: { data, error in
                    if let data {
                        image = UIImage(data: data)
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
