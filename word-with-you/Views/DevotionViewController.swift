//
//  DevotionViewController.swift
//  word-with-you
//
//  Created by Seth Polyniak on 10/25/20.
//  Copyright © 2020 Seth Polyniak. All rights reserved.

//  Controller for the dynamic devotion screen of the app. This view consists of an {image} that covers the entire
//  background, an {audio file} that is controlled by various playback buttons, a {transcript} that is the audio
//  text, a {like button} that adds this devotion to the user's liked list

import UIKit
import AVFoundation

class DevotionViewController: UIViewController {
    
    @IBOutlet weak var playPauseBtn: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var transcriptBtn: UIButton!

    
    var audioPlayer = AVAudioPlayer()
    var playPauseState = 0     // Used when interchanging play/pause functionality for play btn
    
    
    // Add current devotion to liked list
    @IBAction func likeDevotion(_ sender: Any) {
        // Change heart to filled heart
        likeBtn.isSelected = !likeBtn.isSelected
        
        // Add or remove to user's "liked" list
    }
    
    // Open popup modal for transcript of current devotion
    // Have to pass ID of devotion so we can fetch the transcript from the db
    @IBAction func openTranscript(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let transcriptView = storyboard.instantiateViewController(withIdentifier: "TranscriptViewController") as! TranscriptViewController
        transcriptView.modalPresentationStyle = .overCurrentContext
        present(transcriptView, animated: true, completion: nil)
    }
    
    // If play btn is pressed, play audio and change icon to PAUSE - vice versa
    // States => 0: ready to play , 1: ready to pause
    @IBAction func playPauseAudio(_ sender: Any) {
        var playBtn = sender as! UIButton
        if playPauseState == 0 {
            audioPlayer.pause()
            audioPlayer.play()
            print("Playing music")
            playPauseState = 1
            // Set image to pause
            playBtn.setTitle("Pause", for: .normal)
        } else {
            audioPlayer.pause()
            playPauseState = 0
            // Set image to play
            playBtn.setTitle("Play", for: .normal)
        }
    }
    
    // Go to any part of audio via horizontal slider
    @IBAction func scrubAudio(_ sender: Any) {
        audioPlayer.stop();
        audioPlayer.currentTime = TimeInterval(slider.value)
        
        // Set play state to pause
        playPauseBtn.setTitle("Play", for: .normal)
        playPauseState = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
        setBtnStates()
        
        // Update slider by using timers
        _ = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        
        // Get sample mp3
        if let pathString = Bundle.main.path(forResource: "sample1", ofType: ".mp3"){
            try? audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: pathString))
            
        }
        else {
            print("mp3 is corrupted or not found")
        }
        
        // Set slider value
        // TODO: Error handling if audioplayer has no song loaded
        slider.maximumValue = Float(audioPlayer.duration)
        
    }
    
    // Update slider value
    @objc func updateSlider() {
        slider.value = Float(audioPlayer.currentTime)
    }
    
    // Load background image artwork
    func loadImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "login_placeholder")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
    }
    
    // Set states for like button
    func setBtnStates(){
        let likeBtnImg = UIImage(named: "heart")
        let likedTintedImg = likeBtnImg?.withRenderingMode((.alwaysTemplate))
        likeBtn.setImage(likedTintedImg, for: .normal)
        likeBtn.tintColor = .black
        // On enable
        let filledBtnImg = UIImage(named: "filledHeart")
        let filledTintedImg = filledBtnImg?.withRenderingMode((.alwaysTemplate))
        likeBtn.setImage(filledTintedImg, for: .selected)
        likeBtn.tintColor = .black
        
        
        let transcriptBtnImg = UIImage(named: "document")
        let transcriptTintImg = transcriptBtnImg?.withRenderingMode((.alwaysTemplate))
        transcriptBtn.setImage(transcriptTintImg, for: .normal)
        transcriptBtn.tintColor = .black
    }

    
    
    
}
