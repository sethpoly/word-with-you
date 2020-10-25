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
    
    var audioPlayer = AVAudioPlayer()
    var playPauseState = 0     // Used when interchanging play/pause functionality for play btn
    @IBOutlet weak var slider: UISlider!
    
    
    // Add current devotion to liked list
    @IBAction func likeDevotion(_ sender: Any) {
    }
    
    // Open popup modal for transcript of current devotion
    // TODO: Have to design this modal
    @IBAction func openTranscript(_ sender: Any) {
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
        } else {
            audioPlayer.pause()
            playPauseState = 0
            // Set image to play
        }
        
    }
    
    // Go to any part of audio via horizontal slider
    @IBAction func scrubAudio(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update slider by using timers
        _ = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        
        // Get sample mp3
        if let pathString = Bundle.main.path(forResource: "sample1", ofType: ".mp3"){
            try? audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: pathString))
            
        }
        else {
            print("mp3 is corrupted or not found")
        }
        
        
      
        // Load audio source to player
//        if let pathString = pathString {
//            let pathURL = URL(fileURLWithPath: pathString)
//            do{
//                try audioPlayer = AVAudioPlayer(contentsOf: pathURL)
//            } catch {
//                print("error")
//            }
//        }
        
        // Set slider value
        slider.maximumValue = Float(audioPlayer.duration)
    }
    
    // Update slider value
    @objc func updateSlider() {
        slider.value = Float(audioPlayer.currentTime)
        print(slider.value)
    }

    
    
    
}
