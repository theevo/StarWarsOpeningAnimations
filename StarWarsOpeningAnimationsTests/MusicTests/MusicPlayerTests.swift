//
//  MusicPlayerTests.swift
//  StarWarsOpeningAnimations
//
//  Created by Tana Vora on 8/15/25.
//

import Foundation
import Testing

protocol MusicPlayerAdapter {
    func pause()
    func play() async
}

class MusicPlayerSpy: MusicPlayerAdapter {
    var isPlaying = false
    
    func pause() {
        isPlaying = false
    }
    
    func play() async {
        let random = Int.random(in: 0..<3)
        try! await Task.sleep(for: .seconds(random))
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
        await playTimed(sut: sut)
        #expect(sut.isPlaying == true)
    }
    
    @Test func test_playThenPause_isNotPlaying() async throws {
        let sut = MusicPlayerSpy()
        await playTimed(sut: sut)
        sut.pause()
        #expect(sut.isPlaying == false)
    }
    
    private func playTimed(sut: MusicPlayerAdapter) async {
        let start = Date()
        print("▶️ Playing music...")
        await sut.play()
        let end = Date()
        let duration = end.timeIntervalSince(start)
        print("▶️ ... play took \(duration.inSeconds)")
    }
}

extension TimeInterval {
    var inSeconds: String {
        String(format: "%.4f seconds", self)
    }
}
