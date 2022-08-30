/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Your name (e.g. Vo Quoc Huy)
 ID: Your student id (e.g. s3823236)
 Created  date: dd/mm/yyyy (e.g. 27/08/2022)
 Last modified: dd/mm/yyyy (e.g. 28/08/2022)
 Acknowledgement: https://www.hackingwithswift.com/forums/swiftui/playing-sound/4921
 */

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

// Class to control the backgroud music
class backgroundMusicPlayer {
    static let shared = backgroundMusicPlayer()
    var audioPlayer: AVAudioPlayer?

    // Func to start the background music
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
    
    // Func to stop the background music
    func stopBackgroundMusic() {
        guard let audioPlayer = audioPlayer else { return }
        audioPlayer.stop()
    }
}

// Func to load the soundtrack
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
