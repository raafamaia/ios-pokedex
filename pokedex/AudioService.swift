//
//  AudioService.swift
//  pokedex
//
//  Created by R. Maia on 9/18/16.
//  Copyright © 2016 RM. All rights reserved.
//

import Foundation
import AVFoundation


class AudioService {

    static let Instance = AudioService()
    private var musicPlayer: AVAudioPlayer!
    
    var isPlaying: Bool {
        get {
            return musicPlayer.isPlaying
        }
    }
    
    private init(){
        prepareAudio()
    }
    
    private func prepareAudio() {
        
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")!
        
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            //musicPlayer.play()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func play() {
        self.musicPlayer.play()
    }
    
    func stop() {
        self.musicPlayer.stop()
    }

}
