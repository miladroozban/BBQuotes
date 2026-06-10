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
            
                ZStack(alignment: .top) {
                    Image(show.replacingOccurrences(
                        of: " ",
                        with: "").lowercased())
                        .resizable()
                        .scaledToFit()
                    ScrollView {
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
                         
                        }.padding()
                        VStack(alignment:.leading){
                            Text(character.name)
                                .font(.largeTitle)
                                .bold()
                            Text("Portrayed By: \(character.portrayedBy)")
                                .font(.subheadline)
                            Divider()
                            
                            Text("\(character.name) Character Info")
                                .font(.title2)
                            Text("Born: \(character.birthday)")
                            Divider()
                                
                            Text("Occupations: ")
                            ForEach(character.occupations, id: \.self) { occupation in
                                
                                Text("• \(occupation)")
                                    .font(.subheadline)
                                 
                            }
                            Divider()
                            
                            Text("Nicknames:")
                            
                            if character.aliases.count > 0 {
                                ForEach(
                                    character.aliases,
                                    id: \.self
                                ) { alias in
                                    
                                    Text("• \(alias)")
                                        .font(.subheadline)
                                }
                                
                            } else {
                                Text("None")
                                    .font(.subheadline)
                            }
                            Divider()
                            // if character is dead it will show death data for that Character.
                            // used optionals in Death model and unwraped with assurance of exicting data.
                            DisclosureGroup("Status (Spoiler Alert):"){
                                VStack(alignment:.leading){
                                    Text(character.status)
                                        .font(.title2)
                                    if let death = character.death {
                                        AsyncImage(
                                            url: death.image) { image in
                                                image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .clipShape(.rect(cornerRadius: 25))
                                
                                            } placeholder: {
                                                ProgressView()
                                            }
                                        if let details = death.details {
                                            Text("How:\(details)")
                                                .padding(.bottom,10)
                                        }
                                        if let lastWords = death.lastWords {
                                            Text("last Words: \(lastWords)")
                                        }
                                        
                                    }
                                }
                                .frame(maxWidth:.infinity,alignment:.leading)
                            }.tint(.primary)
                        }
                        .frame(width:geo.size.width/1.35,
                               alignment:.leading)
                        .padding(.bottom,50)
                    }
                    .scrollIndicators(.hidden)
                
                }
            }
        
//        .preferredColorScheme(.dark)
        .ignoresSafeArea()
    }
        
}

#Preview {
    
    CharacterView(show: "Breaking Bad", character: ViewModel().character)
}
