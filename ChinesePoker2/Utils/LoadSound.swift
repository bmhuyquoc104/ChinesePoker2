//
//  LoadSound.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 27/08/2022.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

class backgroundMusicPlayer {
    static let shared = backgroundMusicPlayer()
    var audioPlayer: AVAudioPlayer?

    func startBackgroundMusic(sound: String, type: String) {
        if let bundle = Bundle.main.path(forResource: sound, ofType: type) {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
    
    func stopBackgroundMusic() {
        guard let audioPlayer = audioPlayer else { return }
        audioPlayer.stop()
    }
}





func playSound(sound: String, type: String) {
    
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
        } catch {
            print("ERROR")
        }
    }
}
