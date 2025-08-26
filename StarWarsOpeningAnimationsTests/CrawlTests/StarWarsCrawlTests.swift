//
//  StarWarsCrawlTests.swift
//  StarWarsOpeningAnimationsTests
//
//  Created by Tana Vora on 8/26/25.
//

import StarWarsOpeningAnimations
import Testing

struct StarWarsCrawlTests {
    @Test func test_Crawl_Ep4_mentionsPrincessLeia() async throws {
        #expect(StarWarsCrawl.Episode4.crawl.contains("Princess Leia"))
    }
    
    @Test func test_Crawl_Ep4_has2LineBreaksAfterFirstParagraph() async throws {
        #expect(StarWarsCrawl.Episode4.crawl.contains("Galactic Empire.\n\nDuring the battle"))
    }
    
    @Test func test_Crawl_Ep4_title_isUppercasedTitle() async throws {
        #expect(StarWarsCrawl.Episode4.title == StarWarsCrawl.Episode4.title.uppercased())
    }
    
    @Test func test_Crawl_Ep4_episodeNumber_containsIV() async throws {
        #expect(StarWarsCrawl.Episode4.episodeNumber.contains("IV"))
    }
}
