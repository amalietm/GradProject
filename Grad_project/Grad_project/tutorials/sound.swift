//
//  sound.swift
//  Grad_project
//
//  Created by Amalie Morch on 05/05/2023.
//

import SwiftUI

import AVKit
// add circle to show time or distance?

class SoundManager {
    
    // initializing it once and access through this instance for every use
    // singleton - single instance of sound manager
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case shortBeep
        case longBeep
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "mp3") else {return}
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("error\(error.localizedDescription)")
        }
        
    }
    
}
struct sound: View {
    var body: some View {
        Button("Play") {
            SoundManager.instance.playSound(sound: .shortBeep)
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
    }
}

struct sound_Previews: PreviewProvider {
    static var previews: some View {
        sound()
    }
}
