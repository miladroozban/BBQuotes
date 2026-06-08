//
//  CharacterView.swift
//  BBQuotes
//
//  Created by Milad Roozban on 6/3/26.
//

import SwiftUI

struct CharacterView: View {
    let show: String
    let character : Char
    var body: some View {
        GeometryReader() { geo in
            ScrollView {
                ZStack(alignment: .top) {
                    Image(show.replacingOccurrences(
                        of: " ",
                        with: "").lowercased())
                        .resizable()
                        .scaledToFit()
                
                    VStack {
                        AsyncImage(
                            url: character.images[0]) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(.rect(cornerRadius: 25))
                                    .padding(.top,70)
                                
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(
                                width: geo.size.width/1.3,
                                height: geo.size.height/1.7
                            )
                        Text(character.name)
                            .font(.title)
                            .bold()
                    }
                    VStack(alignment:.leading){
                        
                    }
                    
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    
    CharacterView(show: "Breaking Bad", character: ViewModel().character)
}
