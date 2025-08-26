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
        #expect(StarWarsCrawl.Episode4.text.contains("Princess Leia"))
    }
    
    @Test func test_Crawl_Ep4_has2LineBreaksAfterFirstParagraph() async throws {
        #expect(StarWarsCrawl.Episode4.text.contains("Galactic Empire.\n\nDuring the battle"))
    }
    
    @Test func test_Crawl_Ep4_startsWithEpisodeIVandTitle() async throws {
        print(StarWarsCrawl.Episode4.text)
        #expect(StarWarsCrawl.Episode4.text.starts(with: "Episode IV\n\nA NEW HOPE\n\n"))
    }
}
