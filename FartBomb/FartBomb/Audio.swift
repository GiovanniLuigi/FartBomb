//
//  Audio.swift
//  FartBomb
//
//  Created by Giovanni Bruno on 26/04/18.
//  Copyright © 2018 Giovanni Bruno. All rights reserved.
//

import Foundation
import AVFoundation

var backgroundMusicPlayer: AVAudioPlayer!
var audioPlayer: AVAudioPlayer?


func playBackgroundMusic(filename: String) {
    let resourceUrl = Bundle.main.url(forResource: filename, withExtension: nil)
    guard let url = resourceUrl else {
        print("Could not find file: \(filename)")
        return
    }
    do {
        try backgroundMusicPlayer = AVAudioPlayer(contentsOf: url)
        backgroundMusicPlayer.stop()
        backgroundMusicPlayer.numberOfLoops = 0
//        backgroundMusicPlayer.rate = 5
        backgroundMusicPlayer.volume = 1000
        backgroundMusicPlayer.prepareToPlay()
        backgroundMusicPlayer.play()
    } catch {
        print("Could not create audio player!")
        return
    }
}
