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
    var sec = 0
    var min = 0
    var autoContinue = false
    var isRunning    = false
    var musicArray   = [MusicDataModel] ()
    var runningTime  = Timer()
    var currentMusicIndex: Int!

    let playingAudio = playingSongDI(audioPrepareation: AudioPreparation() )

    lazy var viewModel = {
        return MusicUIViewModel( audio: playingAudio)
    }()
    
    @IBOutlet var musicNameLabel: UILabel!
    @IBOutlet var albumNameLabel: UILabel!
    @IBOutlet var songImage: UIImageView!
    @IBOutlet var totalTimeLabel: UILabel!
    @IBOutlet var currentTimeLabel: UILabel!
    @IBOutlet weak var volumeControll: UISlider!
    @IBOutlet weak var minSound: UIImageView!
    @IBOutlet var progressMusicBar: UIProgressView!
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        viewModel.updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songImage.layer.cornerRadius = 30
        songImage.clipsToBounds      = true
        
        //Start Playing The Selected Music
        bindValues()
        viewModel.handlePlayOrPauseMusic()
        
        volumeControll.setValue(0.75, animated: true)
        viewModel.setAudioVolume(volumeDegree: 0.75)
        
    }
    
    func bindValues(){
        viewModel.sec.bind { [weak self] sec in self?.sec = sec }
        viewModel.min.bind { [weak self] min in self?.min = min }
        viewModel.autoContinue.bind { [weak self] autoContinue in self?.autoContinue = autoContinue }
        viewModel.currentMusicIndex.bind { [weak self] currentMusicIdx in self?.currentMusicIndex = currentMusicIdx }
        viewModel.musicArray.bind { [weak self] musicArray in self?.musicArray = musicArray }
        viewModel.isRunning.bind { [weak self] isRunning in self?.isRunning = isRunning }
        
        //UI binding
        viewModel.albumNameLabel.bind   { [weak self] albumName  in self?.albumNameLabel.text       = albumName }
        viewModel.currentTimeLabel.bind { [weak self] timeText   in self?.currentTimeLabel.text     = timeText  }
        viewModel.musicNameLabel.bind   { [weak self] musicName  in self?.musicNameLabel.text       = musicName }
        viewModel.totalTimeLabel.bind   { [weak self] totalTime  in self?.totalTimeLabel.text       = totalTime }
        viewModel.progressMusicBar.bind { [weak self] progress   in self?.progressMusicBar.setProgress((self?.viewModel.progressMusicBar.value)!, animated: true )
            
        }
        viewModel.songImage.bind        { [weak self] songImage  in self?.songImage.image = UIImage(named: songImage)}
        
        viewModel.playBtn.bind { [weak self] playPauseImage in
            DispatchQueue.main.async {
            self?.playBtn.setBackgroundImage(UIImage(named: playPauseImage), for: .normal)
            }
        }

       // viewModel.volumeControll.bind   { [weak self] volumeControl  in self?.volumeControll}


    }
    
    //MARK: - Volume Slider
    
    @IBAction func volumeSlider(_ sender: UIButton) {
        switch volumeControll.value {
        case 0:
            minSound.image  = UIImage(systemName: "speaker.slash")
            
        default:
            minSound.image  = UIImage(named: "Icon Min")
            viewModel.audioManager.audio!.volume = volumeControll.value
            
        }
    }
    
    //MARK: - Playing Audio Functionaliy
    
    @IBAction func shuffle(_ sender: UIButton) {
        viewModel.shuffleMusic()
    }
    
    @IBAction func fastForward(_ sender: UIButton) {
        viewModel.playNext()
    }
    
    @IBOutlet weak var playBtn: UIButton!
    @IBAction func play(_ sender: Any){
        viewModel.updateUI()
    }
    
    @IBAction func rewind(_ sender: UIButton){
        viewModel.rewind()
    }
    
    @IBAction func showMusicList(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
//    private func playNext() {
//        currentMusicIndex += 1
//        if currentMusicIndex < musicArray.count , currentMusicIndex >= 0 {
//            handleTheUpdateOfUI()
//        }else{
//            currentMusicIndex = 0
//            handleTheUpdateOfUI()
//        }
//    }
//
//
//    //MARK: - Update the UI Code
//
//    func updateUI() { isRunning ? pauseMusicUI() : playMusicUI() }
//
  //  @objc func updateProgress () {
//        var progressAudioTime : Float = 0.0
//        progressAudioTime = Float(musicArray[currentMusicIndex].musicTime)!
//
//
//        if progressMusicBar.progress >= 1 - (1 / progressAudioTime) {
//
//            runningTime.invalidate()
//            progressMusicBar.progress = 0
//            sec = 0 ; min = 0 ; //showCurrentTime()
//            //playBtn.setImage(UIImage(named: "play"), for: .normal)
//            autoContinue = true
//            //playNext()
//
//        }
//        else {
//
//            switch sec {
//            case 59:
//                min += 1
//                sec = 0
//                //showCurrentTime()
//            default:
//                sec += 1
//                //showCurrentTime()
//            }
//
//            progressMusicBar.progress += 1 / progressAudioTime
//
//            progressMusicBar.setProgress(progressMusicBar.progress, animated: true)
//
//        }
//    }
//
//    // Show the current music time
//    func showCurrentTime () {
//        currentTimeLabel.text = "\(min.toString()):\(sec.toString())"
//    }
//
    
    //MARK: - Dismiss
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true)
        
    }

    // MARK: - playingMusic
//
//    func playMusic (playingAudioName : String) {
//        guard let url = Bundle.main.url(forResource: playingAudioName, withExtension: ".mp3") else {
//            return
//        }
//
//        do {
//            audio = try AVAudioPlayer(contentsOf: url)
//        }
//        catch
//        {
//            print("Error while playing audio :: \(error)")
//        }
//        musicArray[currentMusicIndex].musicTime = String(audio.duration)
//        audio.play()
//    }
//
//    func handleTheUpdateOfUI() {
//        if playBtn.currentBackgroundImage != UIImage(named: "play") , audio != nil {
//            pauseMusicUI()
//        }
//
//        sec = 0
//        min = 0
//        progressMusicBar.progress = 0
//        showCurrentTime()
//
//        playMusic(playingAudioName: musicArray[currentMusicIndex].musicName)
//        updateUI()
//
//        DispatchQueue.main.async {
//            self.musicNameLabel.text = self.musicArray[self.currentMusicIndex].musicName
//            self.totalTimeLabel.text = self.audio.durationWithMinAndSec()
//            self.albumNameLabel.text = self.musicArray[self.currentMusicIndex].musicAlbum
//            self.songImage.image = UIImage(named: self.musicArray[self.currentMusicIndex].musicImage)
//            if self.autoContinue { self.playMusic(playingAudioName: self.musicNameLabel.text!)}
//        }
//
//    }
//
//    func pauseMusicUI() {
//        isRunning.toggle()
//        runningTime.invalidate()
//        audio.pause()
//        playBtn.setBackgroundImage(UIImage(named: "play"), for: .normal)
//    }
//
//    func playMusicUI() {
//        isRunning.toggle()
//        playBtn.setBackgroundImage(UIImage(named: "pause"), for: .normal)
//        audio.play()
//        runningTime = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
//    }
}

