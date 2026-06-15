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
    var episode:Episode
    
    init() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let quoteData = try! Data(
            contentsOf: Bundle.main.url(forResource: "samplequote", withExtension: "json")!)
        quote = try! decoder.decode(Quote.self, from: quoteData)
        
        let characterData = try! Data(
            contentsOf: Bundle.main.url(forResource: "samplecharacter", withExtension: "json")!)
        character = try! decoder.decode(Char.self, from:characterData)
        
        let episodeData = try! Data(contentsOf: Bundle.main.url(
            forResource: "sampleepisode",
            withExtension: "json")!)
        episode = try! decoder.decode(Episode.self, from: episodeData)
    }
    
    func getQuoteData(for show:String) async {
        do {
            
            quote = try await fetcher.fetchQuotes(from: show)
            
            character = try await fetcher.fetchCharacter(quote.character)
            
            character.death = try await fetcher.fetchDeath(for: character.name)
            
            status = .success
            
        } catch {
            status = .failed(error: error)
        }
    }
    
    func getEpisodeData(for show:String) async {
        
        status = .fetching
        
        do {
            if let unwrapedEpisode = try await fetcher.fetchEpisode(for: show) {
                episode = unwrapedEpisode
            }
        } catch {
            status = .failed(error: error)
        }
        
    }
}
