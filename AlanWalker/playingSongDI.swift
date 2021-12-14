//
//  playingSongDI.swift
//  AlanWalker
//
//  Created by Hady Helal on 30/11/2021.
//  Copyright © 2021 HadyOrg. All rights reserved.
//

import Foundation
import AVFoundation

protocol AVFoundationProtocol {
    var audio: AVAudioPlayer? { get set }
    func playMusic()
    func pauseMusic()
    func stopMusic()
    func setAudioVolume(volumeDegree: Float)
    func setAudio(with newAudioName: String)

}

class playingSongDI: AVFoundationProtocol {
    
    var audio: AVAudioPlayer?
    var audioPrepareation: AudioPreparationProtocol
    
    init( audioPrepareation: AudioPreparationProtocol ) {
        self.audioPrepareation = audioPrepareation
    }
    
    func setAudio(with newAudioName: String){
        let newAudio = audioPrepareation.playingAudio(with: newAudioName)
        guard let changedAudio = newAudio else {
            return
        }
        self.audio = changedAudio
        self.audio?.prepareToPlay()
    }
    
    func setAudioVolume(volumeDegree: Float) {
        guard let wrappedAudio = audio else { return }
        wrappedAudio.volume = volumeDegree
    }
    
    func playMusic() {
        guard let wrappedAudio = audio else { return }
        DispatchQueue.global().async {
            wrappedAudio.play()
        }
        
    }
    
    func pauseMusic() {
        guard let wrappedAudio = audio else { return }
        DispatchQueue.global().async {
        wrappedAudio.pause()
        }
    }
    
    func stopMusic(){
        guard let wrappedAudio = audio else { return }
        DispatchQueue.global().async {
        wrappedAudio.stop()
        }
    }

}
