//
//  DeviceManager.swift
//  DeviceTest
//
//  Created by Kaique Magno Dos Santos on 26/04/18.
//  Copyright © 2018 Kaique Magno. All rights reserved.
//

import UIKit
import AVFoundation

class DeviceManager {
    
    enum Sounds:String {
        case fart = "Fart1.mp3"
    }
    
    enum Errors:Error {
        case couldNotFindFile
    }
    
    // MARK: - Properties
    // MARK: Private
    private var device = UIDevice.current
    private var screen = UIScreen.main
    private var audio = AVAudioPlayer()
    private var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // MARK: Public
    var brightness:Float {
        set{
            self.set(brightness: newValue)
        }
        get{
            return Float(self.screen.brightness)
        }
    }
    
    var volume:Float {
        set{
            self.set(volume: newValue)
        }
        get{
            return Float(self.audio.volume)
        }
    }
    
    static let shared = DeviceManager()
    
    // MARK: - Init
    private init() { }
    
    // MARK: - Functions
    // MARK: Private
    private func set(brightness:Float) {
        self.screen.brightness = CGFloat(brightness)
    }
    
    private func set(volume:Float) {
        self.audio.volume = volume
    }
    
    private func url(fileName:String, fileExtenstion:String) -> URL? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtenstion) else {
            print("Could not find \(fileName).\(fileExtenstion)")
            return nil
        }
        return url
    }
    
    // MARK: Public
    
    /// Play a Sound
    ///
    /// - Parameter sound: Selected sound
    /// - Returns: `true` if the play. `false` if not play
    func play(sound:Sounds) throws {
        
        guard let url = self.url(fileName: sound.rawValue, fileExtenstion: "mp3") else {
            print("Could not find music URL")
            throw Errors.couldNotFindFile
        }
        
        let player = try AVAudioPlayer(contentsOf: url)
        player.volume = self.volume
        player.play()
        self.audio = player
    }
}
