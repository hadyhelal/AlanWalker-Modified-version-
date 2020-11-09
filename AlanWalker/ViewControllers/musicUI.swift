//
//  musicUI.swift
//  AlanWalker
//
//  Created by Hady on 9/12/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import UIKit
import AVFoundation

class musicUI: UIViewController, AVAudioPlayerDelegate{
    
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
    
    @IBOutlet weak var miniIMage: UIImageView!
    
    @IBOutlet var ProgressMusciBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songImage.layer.cornerRadius = 16.0
        songImage.clipsToBounds      = true
        
        //Start Playing The Selected Music
        handleTheUpdateOfUI()
        
        volumeControll.setValue(1.0, animated: true)
        
        audio.volume = volumeControll.value
        
    }
    
    //MARK: - Volume Slider
    
    @IBAction func volumeSlider(_ sender: Any) {
        switch volumeControll.value {
        case 0:
            miniIMage.image  = UIImage(systemName: "speaker.slash")
            
        default:
            
            miniIMage.image  = UIImage(named: "Icon Min")
            audio.volume     = volumeControll.value
            
        }
    }
    
    //MARK: - Playing Audio Functionaliy
    
    @IBAction func shuffle(_ sender: Any) {
        let random = Int.random(in: 0...musicArray.count)
        
        updateUI()
        currentMusicIndex = random
        handleTheUpdateOfUI()
        
    }
    
    @IBAction func fastForward(_ sender: Any) {
        
        playNext()
    }
    
    @IBOutlet weak var playBtn: UIButton!
    @IBAction func play(_ sender: Any){
        
        updateUI()
    }
    
    
    @IBAction func rewind(_ sender: Any){
        
        currentMusicIndex -= 1
        
        if currentMusicIndex < musicArray.count , currentMusicIndex >= 0{
            
            handleTheUpdateOfUI()
        }
            
        else {
            currentMusicIndex = 0
            handleTheUpdateOfUI()
        }
    }
    
    @IBAction func showMusicList(_ sender: Any) {
        dismiss(animated: true)
    }
    
    fileprivate func playNext() {
        currentMusicIndex += 1
        
        if currentMusicIndex < musicArray.count , currentMusicIndex >= 0{
            
            handleTheUpdateOfUI()
        }
        else{
            
            currentMusicIndex = 0
            handleTheUpdateOfUI()
        }
        
    }
    
    
    //MARK: - Update the UI Code
    
    func updateUI() {
        
        isRunning ? pauseMusicUI() : playMusicUI()
    }
    
    
    
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
    func showCurrentTime ()
    {
        currentTimeLabel.text = "\(min.toString()):\(sec.toString())"
    }
    
    
    //MARK: - Dismiss
    
    @IBAction func dismiss(_ sender: Any) {
        
        audio.stop() // or use audio.pause()
        
        self.dismiss(animated: true, completion: nil )
        
    }
    
    
    // MARK: - playingMusic
    
    func playMusic (playingAudioName : String)
    {
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
    
    
    func handleTheUpdateOfUI()
    {
        
        if playBtn.imageView?.image != UIImage(named: "play") , audio != nil
        {
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
    
    func pauseMusicUI()
    {
        isRunning.toggle()
        runningTime.invalidate()
        audio.pause()
        playBtn.setImage(UIImage(named: "play"), for: .normal)
    }
    
    
    func playMusicUI()
    {
        isRunning.toggle()
        playBtn.setImage(UIImage(named: "pause"), for: .normal)
        audio.play()
        runningTime = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }
}

