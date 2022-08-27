//
//  LoadSound.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 27/08/2022.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

class MusicPlayer {
    static let shared = MusicPlayer()
    var audioPlayer: AVAudioPlayer?

    func startBackgroundMusic() {
        if let bundle = Bundle.main.path(forResource: "MainView", ofType: "wav") {
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
            let audioSession = AVAudioSession.sharedInstance()
                try AVAudioSession.sharedInstance().setCategory(
                    .ambient, mode: .default, options: [.mixWithOthers])
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            
            
        } catch {
            print("ERROR")
        }
    }
}
