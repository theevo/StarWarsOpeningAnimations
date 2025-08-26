//
//  StarWarsCrawl.swift
//  StarWarsOpeningAnimations
//
//  Created by Tana Vora on 8/26/25.
//

import Foundation

public struct StarWarsCrawl {
    public let text: String
}

extension StarWarsCrawl {
    public static let Episode4 = map(film: StarWarsFilm.Episode4)
    
    public static func map(film: StarWarsFilm) -> StarWarsCrawl {
        StarWarsCrawl(text: [
            film.episodeRomanNumerals,
            film.title.uppercased(),
            film.cleanedOpeningCrawl
        ].joined(separator: "\n\n"))
    }
}

public struct StarWarsFilm: Sendable {
    let episodeId: Int
    let title: String
    let openingCrawl: String
}

extension StarWarsFilm {
    public static let Episode4 = StarWarsFilm(
        episodeId: 4,
        title: "A New Hope",
        openingCrawl: """
It is a period of civil war.\r\nRebel spaceships, striking\r\nfrom a hidden base, have won\r\ntheir first victory against\r\nthe evil Galactic Empire.\r\n\r\nDuring the battle, Rebel\r\nspies managed to steal secret\r\nplans to the Empire's\r\nultimate weapon, the DEATH\r\nSTAR, an armored space\r\nstation with enough power\r\nto destroy an entire planet.\r\n\r\nPursued by the Empire's\r\nsinister agents, Princess\r\nLeia races home aboard her\r\nstarship, custodian of the\r\nstolen plans that can save her\r\npeople and restore\r\nfreedom to the galaxy....
"""
    )
}

extension StarWarsFilm {
    var episodeRomanNumerals: String {
        switch episodeId {
        case 1: return "Episode I"
        case 2: return "Episode II"
        case 3: return "Episode III"
        case 4: return "Episode IV"
        case 5: return "Episode V"
        case 6: return "Episode VI"
        case 7: return "Episode VII"
        case 8: return "Episode VIII"
        case 9: return "Episode IX"
        default: return ""
        }
    }
    
    var cleanedOpeningCrawl: String {
        openingCrawl.replacingOccurrences(of: "\r\n\r\n", with: "\n\n")
            .replacingOccurrences(of: "\r\n", with: " ")
    }
}
