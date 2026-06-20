//
//  EpisodeView.swift
//  BBQuotes
//
//  Created by Milad Roozban on 6/20/26.
//

import SwiftUI

struct EpisodeView: View {
    let episode: Episode
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(episode.title)
                .font(.largeTitle)
            
            Text(episode.seasonEpisode)
                .font(.title2)
            AsyncImage(url: episode.image) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 16))
            } placeholder: {
                ProgressView()
            }
            Text(episode.synopsis)
                .font(.title3)
                .minimumScaleFactor(0.5)
                .padding(.bottom)
            Text("Written By: \(episode.writtenBy)")
            
            Text("Directed By: \(episode.directedBy)")
            
            Text("Aired: \(episode.airDate)")
            
        }
        .padding()
        .background(.black.opacity(0.7))
        .foregroundStyle(Color(.white))
        .clipShape(.rect(cornerRadius: 15))
        .padding(.horizontal)
    }
}

#Preview {
    EpisodeView(episode: ViewModel().episode)
}
