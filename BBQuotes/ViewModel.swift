//
//  ViewModel.swift
//  BBQuotes
//
//  Created by Milad Roozban on 5/21/26.
//
import Foundation

@Observable
@MainActor
class ViewModel {
    enum fetchStatus {
        case notStarted
        case fetching
        case success
        case failed(error:Error)
    }
    
    private(set) var status = fetchStatus.notStarted
    private let fetcher = FetchService()
    
    var quote:Quote
    var character:Char
    
    init() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let quoteData = try! Data(
            contentsOf: Bundle.main.url(forResource: "samplequote", withExtension: "json")!)
        quote = try! decoder.decode(Quote.self, from: quoteData)
        
        let characterData = try! Data(
            contentsOf: Bundle.main.url(forResource: "samplecharacter", withExtension: "json")!)
        character = try! decoder.decode(Char.self, from:characterData)
    }
    
    func getData(for show:String) async {
        do {
            
            quote = try await fetcher.fetchQuotes(from: show)
            
            character = try await fetcher.fetchCharacter(quote.character)
            
//            character.death = try await fetcher.fetchDeath(for: character.name)
            
            status = .success
            
        } catch { 
            status = .failed(error: error)
        }
    }
}
