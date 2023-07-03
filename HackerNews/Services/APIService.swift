//
//  APIService.swift
//  HackerNews
//
//  Created by Sean O'Connor on 7/2/23.
//

import Foundation

class APIService {
    static let shared = APIService()

    private let urlSession = URLSession.shared
    private let jsonDecoder = JSONDecoder()

    func fetchData<T: Decodable>(for: T.Type, from string: String) async throws -> T {
        guard let url = URL(string: string) else {
            throw APIError.url(error: "")
        }

        let (data, response) = try await urlSession.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.response(error: "")
        }

        do {
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            return try jsonDecoder.decode(T.self, from: data)
        } catch let error {
            print(error)
            throw APIError.decoding(error: error.localizedDescription)
        }
    }
}

enum APIError: Error {
    case url(error: String)
    case response(error: String)
    case decoding(error: String)
}
