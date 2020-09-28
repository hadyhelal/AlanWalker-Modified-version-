//
//  musicUI.swift
//  AlanWalker
//
//  Created by Hady on 9/12/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import UIKit
import AVFoundation

class musicUI: UIViewController , AVAudioPlayerDelegate{
    
    var audio : AVAudioPlayer! = nil
    var sec = 0
    var min = 0
    var musicData : MusicDataModel?
    
    @IBOutlet var musicNameLabel: UILabel!
    
    @IBOutlet var albumNameLabel: UILabel!
    
    @IBOutlet var songImage: UIImageView!
    
    
    @IBOutlet var totalTimeLabel: UILabel!
    
    @IBOutlet var currentTimeLabel: UILabel!
    
    
    var isRunning = false
    var runningTime = Timer()
    
    @IBOutlet var ProgressMusciBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playMusic()
        updateUI()
        totalTimeLabel.text = audio.durationWithMinAndSec()
        musicNameLabel.text = musicData?.musicName
        albumNameLabel.text = musicData?.musicAlbum
        songImage.image = UIImage(named: musicData!.musicImage)
        
        
        
    }
    
    @IBAction func fastForward(_ sender: Any) {
    }
    
    
    @IBOutlet weak var playBtn: UIButton!
    @IBAction func play(_ sender: Any) {
        
        
        updateUI()
    }
    
    @IBAction func rewind(_ sender: Any) {
    }
    
    func updateUI() {
        if isRunning {
            
            
            isRunning.toggle()
            runningTime.invalidate()
            audio.pause()
            playBtn.setImage(UIImage(named: "play"), for: .normal)
            
        }else{
            
            isRunning.toggle()
            playBtn.setImage(UIImage(named: "pause"), for: .normal)
            audio.play()
            runningTime = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func updateProgress () {
        
        if ProgressMusciBar.progress >= 1 - (1 / musicData!.musicTime) {
            runningTime.invalidate()
            ProgressMusciBar.progress = 0
            sec = 0 ; min = 0 ; showCurrentTime()
            playBtn.setImage(UIImage(named: "play"), for: .normal)
        }
        else {
            if sec == 59 {
                min += 1
                sec = 0
                showCurrentTime()
            }
            else { sec += 1   ; showCurrentTime() }
            
            ProgressMusciBar.progress += 1 / musicData!.musicTime
            
            ProgressMusciBar.setProgress(ProgressMusciBar.progress, animated: true)
            
        }
    }
    // Show the current music time
    func showCurrentTime () {
        currentTimeLabel.text = "\(min.toString()):\(sec.toString())"
    }
    
    // MARK: - playingMusic
    
    func playMusic () {
        let url = Bundle.main.url(forResource: musicData?.musicName, withExtension: ".mp3")!
        do {
            audio = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("error while playing audio :: \(error)")
        }
        musicData?.musicTime = Float(audio.duration)
        audio.play()
        
    }
    
}


//MARK: - AVAudioPlayer Extension to handle the total time view

extension AVAudioPlayer {
    func durationWithMinAndSec () -> String {
        print(self.duration)
        
        let durationInt  = Int(self.duration)
        return "\(durationInt / 60):\(durationInt % 60 )"
        
    }
}

//MARK: - Int Extension
extension Int {
    func toString() -> String {
        if (self < 10 && self >= 0) {
            return "0\(Int(self))"
        } else {
            return "\(Int(self))"
        }
    }
}
