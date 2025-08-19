//
//  CrawlTextView.swift
//  StarWarsOpeningAnimations
//
//  Created by Tana Vora on 8/19/25.
//

import SwiftUI

struct CrawlTextView: View {
    var text1Centered = "Episode IV"
    var text2Centered = "A NEW HOPE"
    var text3Justified = """
    It is a period of civil war. Rebel spaceships, striking from a hidden base, have won their first victory against the evil Galactic Empire.

    During the battle, Rebel spies managed to steal secret plans to the Empire's ultimate weapon, the DEATH STAR, an armored space station with enough power to destroy an entire planet.

    Pursued by the Empire's sinister agents, Princess Leia races home aboard her starship, custodian of the stolen plans that can save her people and restore freedom to the galaxy...
    """
    
    var uiColor: UIColor = .yellow
    var fontSize: CGFloat = 24
    
    private var shapeColor: Color {
        Color(uiColor)
    }
    
    var body: some View {
        VStack {
            Text(text1Centered + "\n")
                .multilineTextAlignment(.leading)
                .foregroundStyle(shapeColor)
                .font(.system(size: fontSize, weight: .heavy))
            Text(text2Centered)
                .multilineTextAlignment(.leading)
                .foregroundStyle(shapeColor)
                .font(.system(size: fontSize, weight: .heavy))
            JustifiedText(
                text: text3Justified,
                font: UIFont.systemFont(ofSize: fontSize, weight: .heavy),
                color: uiColor
            )
        }
        .rotation3DEffect(.degrees (66), axis: (x: 1.0, y: 0.0, z: 0.0))
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        CrawlTextView()
    }
}
