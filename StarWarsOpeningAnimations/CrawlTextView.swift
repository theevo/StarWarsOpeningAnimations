//
//  CrawlTextView.swift
//  StarWarsOpeningAnimations
//
//  Created by Tana Vora on 8/19/25.
//

import SwiftUI

struct CrawlTextViewModel {
    let text1Centered: String
    let text2Centered: String
    let text3Justified: String
    
    init(crawl: StarWarsCrawl) {
        self.text1Centered = crawl.episodeNumber
        self.text2Centered = crawl.title
        self.text3Justified = crawl.crawl
    }
}

struct CrawlTextView: View {
    let viewModel: CrawlTextViewModel
    
    var uiColor: UIColor = .yellow
    var fontSize: CGFloat = 24
    @Binding var degrees: Double
    
    private var shapeColor: Color {
        Color(uiColor)
    }
    
    var body: some View {
        VStack {
            Text(viewModel.text1Centered + "\n")
                .multilineTextAlignment(.leading)
                .foregroundStyle(shapeColor)
                .font(.system(size: fontSize, weight: .heavy))
            Text(viewModel.text2Centered)
                .multilineTextAlignment(.leading)
                .foregroundStyle(shapeColor)
                .font(.system(size: fontSize, weight: .heavy))
            JustifiedText(
                text: viewModel.text3Justified,
                font: UIFont.systemFont(ofSize: fontSize, weight: .heavy),
                color: uiColor
            )
        }
        .rotation3DEffect(.degrees (degrees), axis: (x: 1.0, y: 0.0, z: 0.0))
    }
}

#Preview {
    @Previewable @State var degrees: Double = 66.0
    
    Text("Degrees: \(degrees, specifier: "%.2f")")
    ZStack {
        Color.black.ignoresSafeArea()
        CrawlTextView(
            viewModel: CrawlTextViewModel(crawl: StarWarsCrawl.Episode4),
            degrees: $degrees
        )
    }
    Slider(value: $degrees, in: 0...90)
        .padding(.horizontal)
}
