//
//  JustifiedText.swift
//  StarWarsOpeningAnimations
//
//  Created by Tana Vora on 8/19/25.
//

import SwiftUI

struct JustifiedText: UIViewRepresentable {
    var text: String
    var font: UIFont = .systemFont(ofSize: 24)
    var color: UIColor = .init(.primary)

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        textView.textAlignment = .justified
        textView.font = font
        textView.textColor = color
        textView.text = text
        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

#Preview {
    let text = """
Episode IV

A NEW HOPE

It is a period of civil war. Rebel spaceships, striking from a hidden base, have won their first victory against the evil Galactic Empire.

During the battle, Rebel spies managed to steal secret plans to the Empire's ultimate weapon, the DEATH STAR, an armored space station with enough power to destroy an entire planet.

Pursued by the Empire's sinister agents, Princess Leia races home aboard her starship, custodian of the stolen plans that can save her people and restore freedom to the galaxy....
"""
    JustifiedText(text: text)
}
