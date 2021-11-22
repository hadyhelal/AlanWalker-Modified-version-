//
//  MusicListUIVC.swift
//  AlanWalker
//
//  Created by Hady Helal on 05/11/2021.
//  Copyright © 2021 HadyOrg. All rights reserved.
//

import UIKit
import AVFoundation

class MusicUIVC: UIViewController, AVAudioPlayerDelegate{
    // cmd + shift + o -> opening fastly anything in project
    var audio : AVAudioPlayer! = nil
    var sec = 0
    var min = 0
    var autoContinue = false
    var musicArray = [MusicDataModel] ()
    var currentMusicIndex : Int!
    var isRunning = false
    var runningTime = Timer()
    
    @IBOutlet var musicNameLabel: UILabel!
    @IBOutlet var albumNameLabel: UILabel!
    @IBOutlet var songImage: UIImageView!
    @IBOutlet var totalTimeLabel: UILabel!
    @IBOutlet var currentTimeLabel: UILabel!
    @IBOutlet weak var volumeControll: UISlider!
    @IBOutlet weak var minSound: UIImageView!
    @IBOutlet var ProgressMusciBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songImage.layer.cornerRadius = 30
        songImage.clipsToBounds      = true
        
        //Start Playing The Selected Music
        handleTheUpdateOfUI()
        
        volumeControll.setValue(1.0, animated: true)
        
        audio.volume = volumeControll.value
        
    }
    
    //MARK: - Volume Slider
    
    @IBAction func volumeSlider(_ sender: UIButton) {
        switch volumeControll.value {
        case 0:
            minSound.image  = UIImage(systemName: "speaker.slash")
            
        default:
            minSound.image  = UIImage(named: "Icon Min")
            audio.volume     = volumeControll.value
            
        }
    }
    
    //MARK: - Playing Audio Functionaliy
    
    @IBAction func shuffle(_ sender: UIButton) {
        let random = Int.random(in: 0...musicArray.count)
        
        updateUI()
        currentMusicIndex = random
        handleTheUpdateOfUI()
        
    }
    
    @IBAction func fastForward(_ sender: UIButton) {
        
        playNext()
    }
    
    @IBOutlet weak var playBtn: UIButton!
    @IBAction func play(_ sender: Any){
        updateUI()
    }
    
    
    @IBAction func rewind(_ sender: UIButton){
        currentMusicIndex -= 1
        if currentMusicIndex < musicArray.count , currentMusicIndex >= 0{
            handleTheUpdateOfUI()
        }else {
            currentMusicIndex = 0
            handleTheUpdateOfUI()
        }
    }
    
    @IBAction func showMusicList(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    private func playNext() {
        currentMusicIndex += 1
        if currentMusicIndex < musicArray.count , currentMusicIndex >= 0 {
            handleTheUpdateOfUI()
        }else{
            currentMusicIndex = 0
            handleTheUpdateOfUI()
        }
    }
    
    
    //MARK: - Update the UI Code
    
    func updateUI() { isRunning ? pauseMusicUI() : playMusicUI() }
    
    @objc func updateProgress () {
        var progressAudioTime : Float = 0.0
        progressAudioTime = Float(musicArray[currentMusicIndex].musicTime)!
        
        
        if ProgressMusciBar.progress >= 1 - (1 / progressAudioTime) {
            
            runningTime.invalidate()
            ProgressMusciBar.progress = 0
            sec = 0 ; min = 0 ; showCurrentTime()
            //playBtn.setImage(UIImage(named: "play"), for: .normal)
            autoContinue = true
            playNext()
            
        }
        else {
            
            switch sec {
            case 59:
                min += 1
                sec = 0
                showCurrentTime()
            default:
                sec += 1
                showCurrentTime()
            }
            
            ProgressMusciBar.progress += 1 / progressAudioTime
            
            ProgressMusciBar.setProgress(ProgressMusciBar.progress, animated: true)
            
        }
    }
    
    // Show the current music time
    func showCurrentTime () {
        currentTimeLabel.text = "\(min.toString()):\(sec.toString())"
    }
    
    
    //MARK: - Dismiss
    
    @IBAction func dismiss(_ sender: Any) {
        
        audio.stop() // or use audio.pause()
        
        self.dismiss(animated: true, completion: nil )
        
    }

    // MARK: - playingMusic
    
    func playMusic (playingAudioName : String) {
        let url = Bundle.main.url(forResource: playingAudioName, withExtension: ".mp3")!
        
        do {
            audio = try AVAudioPlayer(contentsOf: url)
        }
        catch
        {
            print("Error while playing audio :: \(error)")
        }
        musicArray[currentMusicIndex].musicTime = String(audio.duration)
        audio.play()
    }
    
    func handleTheUpdateOfUI() {
        if playBtn.currentBackgroundImage != UIImage(named: "play") , audio != nil {
            pauseMusicUI()
        }
        
        sec = 0
        min = 0
        ProgressMusciBar.progress = 0
        showCurrentTime()
        
        playMusic(playingAudioName: musicArray[currentMusicIndex].musicName)
        updateUI()
        
        musicNameLabel.text = musicArray[currentMusicIndex].musicName
        totalTimeLabel.text = audio.durationWithMinAndSec()
        albumNameLabel.text = musicArray[currentMusicIndex].musicAlbum
        songImage.image = UIImage(named: musicArray[currentMusicIndex].musicImage)
        if autoContinue { playMusic(playingAudioName: musicNameLabel.text!)}
        
    }
    
    func pauseMusicUI() {
        isRunning.toggle()
        runningTime.invalidate()
        audio.pause()
        playBtn.setBackgroundImage(UIImage(named: "play"), for: .normal)
    }
    
    func playMusicUI() {
        isRunning.toggle()
        playBtn.setBackgroundImage(UIImage(named: "pause"), for: .normal)
        audio.play()
        runningTime = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }
}

