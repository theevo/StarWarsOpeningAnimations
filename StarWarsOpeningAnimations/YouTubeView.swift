//
//  YouTubeView.swift
//  StarWarsOpeningAnimations
//
//  Created by Tana Vora on 3/17/25.
//

import SwiftUI
import YouTubePlayerKit

struct YouTubeView: View {
    @State private var state: PlayerState = .paused
    
    let youTubePlayer: YouTubePlayer = "https://www.youtube.com/watch?v=e9lapdvLSGw"
    
    let starWarsYouTubePlayer = YouTubePlayer(
        source: .video(id: "HrIJT_4Txqw")
    )
    
    var body: some View {
        ZStack {
            YouTubePlayerView(starWarsYouTubePlayer)
            Color.red
            Button(state.label) {
                buttonPressed()
            }
        }
    }
    
    enum PlayerState {
        case playing
        case paused
        
        var label: String {
            switch self {
            case .playing:
                return "⏸️ Pause"
            case .paused:
                return "▶️ Play"
            }
        }
        
        mutating func toggle() {
            switch self {
            case .playing:
                self = .paused
            case .paused:
                self = .playing
            }
        }
    }
    
    func buttonPressed() {
        Task {
            switch state {
            case .paused:
                    try await starWarsYouTubePlayer.play()
            case .playing:
                    try await starWarsYouTubePlayer.pause()
            }
            state.toggle()
        }
    }
}

#Preview {
    YouTubeView()
}
