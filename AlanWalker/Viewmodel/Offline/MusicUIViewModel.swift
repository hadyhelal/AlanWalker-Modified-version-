//
//  MusicUIViewModel.swift
//  AlanWalker
//
//  Created by Hady Helal on 04/12/2021.
//  Copyright © 2021 HadyOrg. All rights reserved.
//

import Foundation

class MusicUIViewModel {
    
    var audioManager: AVFoundationProtocol
 
    //MARK: - Time variables
    var sec = Box(0)
    var min = Box(0)
    var runningTime = Timer()
    
    //MARK: - Album data variables
    var musicArray: Box<[MusicDataModel]> = Box([])
    var currentMusicIndex = Box(1) //: Int!
    
    var autoContinue      = Box(false)
    var isRunning         = Box(false)
     
    //MARK: -UI Insatances
    var musicNameLabel    = Box("")
    var albumNameLabel    = Box("")
    var songImage         = Box("")
    var playBtn           = Box("play")
    var totalTimeLabel    = Box("")
    var currentTimeLabel  = Box("")
    var progressMusicBar: Box<Float> = Box(0)

    init( audio: AVFoundationProtocol) {
        self.audioManager = audio
    }
    
    func setAudioVolume(volumeDegree : Float){
        self.audioManager.audio!.volume = volumeDegree
    }
    
    func shuffleMusic() {
        let random = Int.random(in: 0...musicArray.value.count - 1)
        
        updateUI()
        currentMusicIndex.value = random
        handlePlayOrPauseMusic()
    }
    
    func updateUI() { isRunning.value ? pauseMusicUI() : playMusicUI() }

    func handlePlayOrPauseMusic() {
        if playBtn.value == "pause" {
            pauseMusicUI()
        }
        
        sec.value = 0
        min.value = 0
        isRunning.value = false
        progressMusicBar.value = 0
        showCurrentTime()
        
        prepareMusicToPLay(playingAudioName: musicArray.value[currentMusicIndex.value].musicName)
        
        updateUI()
        
        self.musicNameLabel.value = self.musicArray.value[self.currentMusicIndex.value].musicName
        self.totalTimeLabel.value = self.audioManager.audio!.durationWithMinAndSec()
        self.albumNameLabel.value = self.musicArray.value[self.currentMusicIndex.value].musicAlbum
        self.songImage.value      = self.musicArray.value[self.currentMusicIndex.value].musicImage
        //if self.autoContinue.value{ self.prepareMusicToPLay(playingAudioName: self.musicNameLabel.value) }
    }
    
    func prepareMusicToPLay (playingAudioName : String) {
        audioManager.setAudio(with: playingAudioName)
    }
    
    @objc func updateProgress () {
        var progressAudioTime : Float = 0.0
        progressAudioTime = Float(musicArray.value[currentMusicIndex.value].musicTime)!
        print(progressAudioTime)
        print("AUDIO DURATION:\(Float(audioManager.audio!.duration))")
        if  !audioManager.audio!.isPlaying  {
            // progressMusicBar.value >= 1 - ( 1 / progressAudioTime)
            runningTime.invalidate()
            progressMusicBar.value = 0
            sec.value = 0 ; min.value = 0 ; showCurrentTime()
            //playBtn.setImage(UIImage(named: "play"), for: .normal)
         //   autoContinue.value = false ///////////
            playNext()
            
        }
        else {
            switch sec.value {
            case 59:
                min.value += 1
                sec.value = 0
                showCurrentTime()
            default:
                sec.value += 1
                showCurrentTime()
            }
            
            progressMusicBar.value += 1 / (Float(audioManager.audio!.duration) )
                        
        }
    }
    
    func playMusicUI() {
        isRunning.value = true
        playBtn.value   = "pause"
        audioManager.playMusic()
        runningTime     = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }
    
    func pauseMusicUI() {
        isRunning.value = false
        playBtn.value   = "play"
        audioManager.pauseMusic()
        runningTime.invalidate()
    }
    
    func playNext() {
        currentMusicIndex.value += 1
        if currentMusicIndex.value < musicArray.value.count , currentMusicIndex.value >= 0 {
            handlePlayOrPauseMusic()
        }else{
            currentMusicIndex.value = 0
            handlePlayOrPauseMusic()
        }
    }
    
    func rewind(){
        guard sec.value < 5 else {
            updateUI()
            handlePlayOrPauseMusic()
            return
        }
        currentMusicIndex.value -= 1
        if currentMusicIndex.value < musicArray.value.count , currentMusicIndex.value >= 0{
            handlePlayOrPauseMusic()
        }else {
            currentMusicIndex.value = 0
            handlePlayOrPauseMusic()
        }

    }
    
    func showCurrentTime () {
        currentTimeLabel.value = "\(min.value.toString()):\(sec.value.toString())"
    }
}
