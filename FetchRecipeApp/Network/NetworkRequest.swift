//
//  NetworkRequest.swift
//  FetchRecipeApp
//
//  Created by Cameron Zakkour on 11/6/23.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case decodingError
}

class Webservice {
    
    func get<T: Decodable>(url: URL, type: T.Type) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if (response as? HTTPURLResponse)?.statusCode != 200 {
            throw NetworkError.badRequest
        }
        
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(type, from: data)
            return result
        } catch {
            print("Network request error: \(error)")
            throw NetworkError.decodingError
        }
    }
}
