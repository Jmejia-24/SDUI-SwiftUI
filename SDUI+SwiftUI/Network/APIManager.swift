//
//  APIManager.swift
//  SDUI+SwiftUI
//
//  Created by Byron on 12/8/24.
//

import Foundation

class APIManager {

    func loadJSONFromFile<T: Decodable>(fileName: String, as type: T.Type) async throws -> T {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw NSError(domain: "JSONError", code: 1, userInfo: [NSLocalizedDescriptionKey: "File not found"])
        }

        let data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()

        return try decoder.decode(T.self, from: data)
    }

}
