//
//  MusicPlayerTests.swift
//  StarWarsOpeningAnimations
//
//  Created by Tana Vora on 8/15/25.
//

import Testing

protocol MusicPlayerAdapter {
    func play()
}

class MusicPlayerSpy: MusicPlayerAdapter {
    var isPlaying = false
    
    func play() {
        isPlaying = true
    }
}

struct MusicPlayerTests {
    @Test func test_player_initiallyNotPlaying() async throws {
        let sut = MusicPlayerSpy()
        #expect(sut.isPlaying == false)
    }
    
    @Test func test_player_plays() async throws {
        let sut = MusicPlayerSpy()
        sut.play()
        #expect(sut.isPlaying == true)
    }
}
