//
//  ViewController.swift
//  audioPlayer
//
//  Created by Doug Wells on 12/15/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var progress: Double = 0.5
    var playerIsPlaying = false
    
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var timeSlider: UISlider!
    
    @IBAction func play(_ sender: Any) {
        player.play()
        timeSlider.value = Float(player.currentTime/player.duration)
        playerIsPlaying = true
    }

    @IBAction func pause(_ sender: Any) {
        player.pause()
        playerIsPlaying = false
    }
    
    @IBAction func stop(_ sender: Any) {
        player.stop()
        player.currentTime = 0
        playerIsPlaying = false
    }
    
    
    @IBAction func sliderMoved(_ sender: Any) {
        player.volume = slider.value
    }
    
    @IBAction func timeSliderMoved(_ sender: Any) {
        progress = Double(timeSlider.value)
        player.currentTime = progress*player.duration
        timeSlider.value = Float(player.currentTime/player.duration)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioPath = Bundle.main.path(forResource: "rainbow", ofType: "mp3")
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            
            
        } catch {
            
            //process errors
        }
        
        if playerIsPlaying {
            timeSlider.value = Float(player.currentTime/player.duration)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


