//
//  FetchService.swift
//  BBQuotes
//
//  Created by Milad Roozban on 5/17/26.
//
import Foundation

struct FetchService {
    
    private enum fetchError: Error {
        case badResponse
    }
    
    private let baseURL = URL(string:"https://breaking-bad-api-six.vercel.app/api")!
    // https://breaking-bad-api-six.vercel.app/api/quotes/random?production=Breaking+Bad
    func fetchQuotes(from show: String) async throws -> Quote {
        
        // build fetch url
        let quoteURL = baseURL.appending(path: "quotes/random")
        let fetchURL = quoteURL.appending(queryItems:[URLQueryItem(name:"production", value: show)])
        // fetch the data
        let (data, response) = try await URLSession.shared.data(from: fetchURL) // "data" function returns a tuple, so we declared a tuple fo getting the data.
        // handle response
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw fetchError.badResponse
        }
        //decode data
        let quote = try JSONDecoder().decode(Quote.self, from: data)
        // return quote
        return quote
    }
    
    func fetchCharacter(_ name: String) async throws -> Char {
        let characterURL = baseURL.appending(path: "characters")
        let fetchURL = characterURL.appending(queryItems: [URLQueryItem(name: "name", value: name)])
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw fetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let characters  = try decoder.decode([Char].self, from: data)
        
        return characters[0]
    }
    
    func fetchDeath (for character: String) async throws -> Death? {
        
       let fetchURL = baseURL.appending(path: "deaths")
        
       let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw fetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        let deaths  = try decoder.decode([Death].self, from: data)
        
        for death in deaths {
            if death.character == character {
                return death
            }
        }
        
        return nil
    }
}
