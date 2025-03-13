//
//  ContentView.swift
//  StarWarsOpeningAnimations
//
//  Created by Tana Vora on 3/13/25.
//

import SwiftUI

struct ContentView: View {
    private var crawl = """
Episode IV\n\n
A NEW HOPE\n\n
It is a period of civil war.\r\nRebel spaceships, striking\r\nfrom a hidden base, have won\r\ntheir first victory against\r\nthe evil Galactic Empire.\r\n\r\nDuring the battle, Rebel\r\nspies managed to steal secret\r\nplans to the Empire's\r\nultimate weapon, the DEATH\r\nSTAR, an armored space\r\nstation with enough power\r\nto destroy an entire planet.\r\n\r\nPursued by the Empire's\r\nsinister agents, Princess\r\nLeia races home aboard her\r\nstarship, custodian of the\r\nstolen plans that can save her\r\npeople and restore\r\nfreedom to the galaxy....
"""
    @State private var offset: CGFloat = 630
    @State private var opacity: Double = 1.0
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Text(crawl)
                    .opacity(opacity)
                    .padding()
                    .fontWeight(.heavy)
                    .offset(y: offset)
                    .foregroundStyle(.yellow)
                    .multilineTextAlignment(.center)
                    .rotation3DEffect(.degrees (60), axis: (x: 1.0, y: 0.0, z: 0.0))
            }
            .onTapGesture {
                withAnimation(.linear(duration: 12)) {
                    offset = -900
                } completion: {
                    withAnimation {
                        opacity = 0
                    } completion: {
                        reset()
                    }
                }
            }
        }
    }
    
    func reset() {
        offset = 630
        opacity = 1
    }
}

#Preview {
    ContentView()
}
