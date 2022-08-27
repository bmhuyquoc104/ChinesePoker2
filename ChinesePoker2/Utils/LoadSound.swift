//
//  LoadSound.swift
//  ChinesePoker2
//
//  Created by Võ Quốc Huy on 27/08/2022.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            try AVAudioSession.sharedInstance().setCategory(
                        AVAudioSession.Category.playback,options: AVAudioSession.CategoryOptions.mixWithOthers)

            try AVAudioSession.sharedInstance().setActive(true)
            
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR")
        }
    }
}
