//
//  ContentView.swift
//  StarWarsOpeningAnimations
//
//  Created by Tana Vora on 3/13/25.
//

import SwiftUI

struct ContentView: View {
    static let size = UIScreen.main.bounds.size
    
    private var crawl = """
Episode IV\n\n
A NEW HOPE\n\n
It is a period of civil war.\r\nRebel spaceships, striking\r\nfrom a hidden base, have won\r\ntheir first victory against\r\nthe evil Galactic Empire.\r\n\r\nDuring the battle, Rebel\r\nspies managed to steal secret\r\nplans to the Empire's\r\nultimate weapon, the DEATH\r\nSTAR, an armored space\r\nstation with enough power\r\nto destroy an entire planet.\r\n\r\nPursued by the Empire's\r\nsinister agents, Princess\r\nLeia races home aboard her\r\nstarship, custodian of the\r\nstolen plans that can save her\r\npeople and restore\r\nfreedom to the galaxy....
"""
    @State private var logoScale: CGFloat = 1.0
    
    // crawl settings
    @State private var offset: CGFloat = 1060
    @State private var opacity: Double = 0.0
    @State private var hiddenMusicView = StarWarsMusicView()
    @State private var isPlaying: Bool = false
    private var crawlTime = 12.0
    
    var body: some View {
        ZStack {
            hiddenMusicView
            Color.black.ignoresSafeArea()
            Image("starwarslogo")
                .scaleEffect(logoScale)
            VStack {
                Text(crawl)
                    .opacity(opacity)
                    .scaleEffect(1.5)
                    .padding()
                    .fontWeight(.heavy)
                    .offset(y: offset)
                    .foregroundStyle(.yellow)
                    .multilineTextAlignment(.center)
                    .rotation3DEffect(.degrees (66), axis: (x: 1.0, y: 0.0, z: 0.0))
            }
            Color.clear.ignoresSafeArea()
                .frame(width: ContentView.size.width, height: ContentView.size.height)
                .contentShape(Rectangle())
                .onTapGesture {
                    viewTapped()
                }
        }
    }
    
    func playAnimation() {
        withAnimation(.smooth(duration: 6)) {
            logoScale = 0.0
        } completion: {
            opacity = 1.0
            withAnimation(.linear(duration: crawlTime)) {
                offset = -900
            } completion: {
                withAnimation {
                    opacity = 0
                } completion: {
                    resetAnimation()
                }
            }
        }
    }
    
    func resetAnimation() {
        logoScale = 1.0
        offset = 630
        opacity = 1
    }
    
    func viewTapped() {
        print("👉", Date())
        hiddenMusicView.buttonPressed()
        
        switch isPlaying {
            case true:
            resetAnimation()
            isPlaying = false
        case false:
            playAnimation()
            isPlaying = true
        }
    }
}

#Preview {
    ContentView()
}
