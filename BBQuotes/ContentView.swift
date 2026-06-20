//
//  ContentView.swift
//  BBQuotes
//
//  Created by Milad Roozban on 5/7/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab (Constants.breakingBad, systemImage: "tortoise") {
                FetchView(show: Constants.breakingBad)
                
            }
            Tab (Constants.betterCallSaul, systemImage: "briefcase") {
                
                FetchView(show: Constants.betterCallSaul)

            }
            Tab (Constants.elCamino, systemImage: "car") {
                
                FetchView(show: Constants.elCamino)

            }
            
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
