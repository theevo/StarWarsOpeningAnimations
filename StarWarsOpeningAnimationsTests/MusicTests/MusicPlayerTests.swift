//
//  MusicPlayerTests.swift
//  StarWarsOpeningAnimations
//
//  Created by Tana Vora on 8/15/25.
//

import Testing

protocol MusicPlayerAdapter {
    func pause()
    func play()
}

class MusicPlayerSpy: MusicPlayerAdapter {
    var isPlaying = false
    
    func pause() {
        isPlaying = false
    }
    
    func play() {
        isPlaying = true
    }
}

struct MusicPlayerTests {
    @Test func test_player_initiallyNotPlaying() async throws {
        let sut = MusicPlayerSpy()
        #expect(sut.isPlaying == false)
    }
    
    @Test func test_play_isPlaying() async throws {
        let sut = MusicPlayerSpy()
        sut.play()
        #expect(sut.isPlaying == true)
    }
    
    @Test func test_playThenPause_isNotPlaying() async throws {
        let sut = MusicPlayerSpy()
        sut.play()
        sut.pause()
        #expect(sut.isPlaying == false)
    }
}
