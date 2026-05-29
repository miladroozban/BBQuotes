//
//  QuoteView.swift
//  BBQuotes
//
//  Created by Milad Roozban on 5/25/26.
//

import SwiftUI

struct QuoteView: View {
    let vm = ViewModel()
    let show: String
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
                    .resizable()
                    .scaledToFill()
                VStack {
                    Text("\"\(vm.quote.quote)\"")
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .background(.black.opacity(0.5))
                        .clipShape(.rect(cornerRadius:25))
                        .padding()
                    
                    ZStack(alignment:.bottom) {
                        AsyncImage(
                            url: vm.character.images[0]) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(.rect(cornerRadius: 50))
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: geometry.size.width/1.1, height: geometry.size.height/1.8)
                        
                        Text(vm.quote.character)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                        
                            
                    }
                    .frame(width: geometry.size.width/1.1, height: geometry.size.height/1.8)
                }
                .frame(width:geometry.size.width)
                .clipShape(.rect(cornerRadius:50))

            }
            .frame(width: geometry.size.width , height: geometry.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuoteView(show: "Breaking Bad")
        .preferredColorScheme(.dark)
}
